#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# Author:       Casey Sparks
# Date:
# Description:
'''
The `help()` description of the script goes here.
'''

import argparse
import locale
import logging
import sys
from ipaddress import IPv4Network

# Enable logging, set locale, set args.
handler = logging.StreamHandler()
log = logging.getLogger()

handler.setFormatter(logging.Formatter(
    '%(asctime)s: %(name)s | %(lineno)d - %(levelname)s %(message)s'
))
locale.setlocale(locale.LC_ALL, 'en_US.UTF-8')
log.addHandler(handler)
log.setLevel(logging.INFO)


def get_arguments() -> argparse.Namespace:
    '''Get cmdline arguments.'''
    parser = argparse.ArgumentParser(
        description='Add a useful description here.'
    )
    parser.add_argument(                                        # Enable DEBUG logging.
        '--verbose', '-v',
        action='store_const',
        dest='loglevel',
        const=logging.DEBUG,
        help='Set log level to DEBUG.'
    )

    return parser.parse_args()


if __name__ == '__main__':
    args = get_arguments()                                      # Get cmdline arguments.
    ips = sys.argv[1:]

    if args.loglevel:                                           # Set debug output.
        log.setLevel(args.loglevel)
        logging.basicConfig(
            filename=f'./{__name__}.log'
        )

    for ip in ips:
        pass
