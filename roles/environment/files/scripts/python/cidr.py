#!/usr/bin/env python3
# -*- coding:utf-8 -*-
# Name:         cidr
# Author:       Casey Sparks
# Date:         March 10, 2023
# Description:
"""Parse IPv4 and IPv6 addresses between CIDR and netmask."""

from argparse import ArgumentParser, Namespace
from ipaddress import ip_network, IPv4Network, IPv6Network
from locale import setlocale, LC_ALL
from math import ceil, log
from re import match as re_match
from sys import exit as sys_exit

setlocale(LC_ALL, 'en_US.UTF-8')  # Set locale.

ip_network.__defaults__ = (False,)  # Disable strict addressing.


def get_arguments() -> Namespace:
    """
    Get cmdline arguments.
        :return:    argparse.Namespace() instance of user-provided commandline arguments.
    """
    parser = ArgumentParser(description=__doc__)  # Instantiate argument parser.
    mutex_group = parser.add_mutually_exclusive_group()  # Create mutex argument group.

    mutex_group.add_argument(  # --address
        '-a',
        '--address',
        type=ip_network,
        dest='address',
        help='Subnet to parse, like `192.168.0.1/16`, `10.0.0.1/255.0.0.0`, or `::1`.',
    )
    mutex_group.add_argument(  # --hosts
        '-n',
        '--hosts',
        type=int,
        dest='number_of_hosts',
        help='Get the minimum netmask for a given number of hosts.',
    )
    mutex_group.add_argument(  # --size
        '-s',
        '--size',
        type=str,
        dest='prefix',
        help='Calculate the maximum number of hosts, given a prefix or subnet mask.',
    )

    arguments = parser.parse_args()

    if set(arguments.__dict__.values()) == {None}:
        parser.print_help()
        sys_exit(1)

    if arguments.number_of_hosts and not 0 < arguments.number_of_hosts <= 2**128:
        parser.error('Number of hosts must be between 1 and 2^128.')

    return arguments


def print_table(table_list: list[str], right_padding: int) -> None:
    """
    Create and print a network table.
        :param table_list:      The table to print.
        :param right_padding:   The amount of whitespace padding in the table.
    """
    assert isinstance(table_list, list), '`table_list` must be instance of list[str].'
    assert isinstance(right_padding, int), '`right_padding` must be instance of int().'
    assert all(len(sublist) == 2 for sublist in table_list), '`table_list sublists must have length 2.'
    assert all(
        isinstance(item, str) for item in [item for sublist in table_list for item in sublist]
    ), '`table_list` must be list of lists of str().'

    for heading, data in table_list:  # Print table.
        print(f'{heading:<18}{data:>{right_padding}}')


def get_network_table(subnet: (IPv4Network | IPv6Network)) -> tuple[list[list], int]:
    """
    Create and print a network table.
        :param subnet:  The network string to print (like 10.10.10.10/24).
        :return:        Tuple containing (the network table list, right padding int for the table).
    """
    assert isinstance(subnet, (IPv4Network, IPv6Network)), '`subnet` must be instance of ip_network().'

    host_bits = str(subnet).split('/', maxsplit=1)[0]  # Get host bits.
    div, netmask, r_pad = (58 * '=', 'Prefix', 40) if isinstance(subnet, IPv6Network) else (34 * '=', 'Netmask', 16)

    net_table = [
        [div, ''],
        [f'{subnet}', ''],
        [div.replace('=', '-'), ''],
        ['Host Address', f'{None if host_bits.endswith(".0") else host_bits}'],
        ['Network Address', f'{subnet.network_address}'],
        ['Broadcast Address', f'{subnet.broadcast_address}'],
        ['Hostmask', f'{subnet.hostmask}'],
        [netmask, f'{subnet.netmask}'],
        [f'CIDR {netmask}', f'/{subnet.prefixlen}'],
        ['Version', f'IPv{subnet.version}'],
        ['Private', f'{subnet.is_private}'],
        ['Reserved', f'{subnet.is_reserved}'],
        ['First IP', f'{subnet[0]}'],
        ['Last IP', f'{subnet[-1]}'],
        [div.replace('=', '-'), ''],
        [
            'Usable Addresses',
            f'{subnet.num_addresses - 3 if subnet.num_addresses >= 4 else 1:,}',
        ],
        ['Total Addresses', f'{subnet.num_addresses:,}'],
        [div, ''],
    ]

    return net_table, r_pad


def get_netmask_table(hosts: int) -> tuple[list[list], int] | None:
    """
    Print the minimum netmask/prefix length for a subnet with a given number of hosts.
        :param hosts:   The maximum number of hosts on the subnet.
        :return:        None, or a tuple containing (the netmask table list, right padding int for the table).
    """
    assert isinstance(hosts, int) and hosts > 0, '`hosts` must be instance of int() > 0.'

    div = 57 * '='  # Div length for IPv4 addresses.
    ip6_cidr = f'/{128 - ceil(log(hosts, 2))}'

    if hosts <= 2**32:
        ip4_cidr = f'/{32 - ceil(log(hosts, 2))}'
        ip4_netmask = str(ip_network(f'0.0.0.0{ip4_cidr}').netmask)
    else:
        ip4_cidr = '-'
        ip4_netmask = '-'

    net_table = [
        [div, ''],
        [f'{hosts} Total Addresses', ''],
        [div.replace('=', '-'), ''],
        ['IPv4 CIDR', ip4_cidr],
        ['IPv4 Netmask', ip4_netmask],
        ['IPv6 CIDR', ip6_cidr],
        ['IPv6 Netmask', str(ip_network(f'::{ip6_cidr}').netmask)],
    ]

    return net_table, 39


def get_max_hosts_table(netmask: str) -> int:
    """
    Calculate the maximum number of hosts for a given subnet mask or prefix length.
        :param netmask: The mask/prefixlen in question.
        :return:        The max-hosts table.
    """

    def _max_hosts(netmask: int, max_prefix: int = 32) -> str:
        """
        Calculate the maximum number of hosts for a given netmask and maximum prefix.
            :param netmask:     The mask/prefixlen in question.
            :param max_prefix:  The largest possible prefix. 32 for IPv4 or 128 for IPv6.
            :return:            String containing the maximum number of hosts.
        """
        assert isinstance(netmask, int), '`netmask` must be int.'
        assert netmask <= 128, '`netmask` must be <= 128.'
        assert isinstance(max_prefix, int), '`max_prefix` must be int.'
        assert max_prefix in {32, 128}, '`max_prefix` must be either 32 or 128.'

        return f'{2 ** (max_prefix - netmask):,}' if netmask <= max_prefix else 'Network too large'

    netmask = netmask.lstrip('/')  # Remove leading slash if present.
    div = 69 * '='  # Div length for IPv4 addresses.

    assert isinstance(netmask, str), '`netmask` must be instance of str().'
    assert (
        re_match(  # Check netmask is valid.
            r'^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$',
            netmask,
        )
        or 0 <= int(netmask) <= 32
    ), 'Invalid netmask.'

    match netmask.count('.'):  # Check if netmask. Maybe a bad check.
        case 3:  # Is a netmask.
            netmask = IPv4Network(f'0.0.0.0/{netmask}').prefixlen
        case _:  # Is a prefix length.
            pass

    host_table = [  # Hosts table.
        [div, ''],
        [f'Max. hosts for {netmask} mask.', ''],  # Heading.
        [div.replace('=', '-'), ''],
        ['Max. IPv4 hosts', _max_hosts(int(netmask), 32)],
        ['Max. IPv6 hosts', _max_hosts(int(netmask), 128)],
        [div.replace('=', '-'), ''],
    ]

    return host_table, 51


if __name__ == '__main__':
    args = get_arguments()

    if args.address:
        table, padding = get_network_table(args.address)

    elif args.number_of_hosts:
        table, padding = get_netmask_table(args.number_of_hosts)

    elif args.prefix:
        table, padding = get_max_hosts_table(args.prefix)

    else:
        sys_exit(1)

    print_table(table, padding)
