#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# Author:       Casey Sparks
# Date:         February 10, 2022
# Description:
'''
A script to create PGP-encrypted scripts.
Note that decrypted scripts get passed to a bash subshell, so all
non-POSIX files **must** have a shebang in order to be properly
interpreted by bash.
'''

import argparse
import locale
import logging
import os
import pathlib
import psutil
import gnupg

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
    parser = argparse.ArgumentParser(                           # Instantiate parser.
        description='Create executable PGP-encrypted scripts.'
    )
    parser.add_argument(                                        # Specify recipients.
        '--recipients', '-r',
        dest='recipients',
        nargs='+',
        default=[],
        help='Specify who can decrypt the file.'
    )
    parser.add_argument(                                        # Specify input files.
        '--inputs', '-i',
        dest='file',
        nargs='+',
        help='Specify files to encrypt.'
    )

    return parser.parse_args()


def munge_arguments(args: argparse.Namespace) -> argparse.Namespace:
    '''Resolve inputs > filepaths.'''
    pwd = pathlib.Path()                                        # Define current directory.

    args.recipients.append(os.environ.get('GPG_KEY_ID'))        # Add ourselves to the recipients.

    for file in args.file:
        index = args.file.index(file)

        if file[0] == '/':                                      # Define the path
            args.file[index] = pathlib.Path(file)               # if it's absolute, and
        else:
            args.file[index] = pwd/file                         # if it's relative.


def prechecks_pass(args: argparse.Namespace) -> bool:
    '''Check that inputs and processes are as expected.'''
    gpg_procs = ['gpg-agent', 'gpgconf']

    for gpg_proc in gpg_procs:                                  # Check that a GPG agent is running.
        for proc in psutil.process_iter():
            try:
                if gpg_proc.lower() in proc.name().lower():
                    pass
            except (psutil.NoSuchProcess, psutil.AccessDenied, psutil.ZombieProcess) as err:
                log.exception(f'{gpg_proc} not running on host. Restarting.')
                raise err

    for file in args.file:                                      # Check that the input files exist.
        try:
            file.resolve(strict=True)
        except FileNotFoundError as file_err:
            log.exception(f'File {file} not found: {file_err}')
            raise file_err

    return True


def encrypt(file: pathlib.PosixPath, recipients: list) -> pathlib.PosixPath:
    '''Decrypt seed phrase and return its value.'''
    out_file = file.with_suffix('')                             # Strip suffix, if exists.

    log.debug(f'Encrypting file: {file}.')

    try:
        cipherfile = gpg.encrypt_file(                          # Encrypt the file.
            open(file, 'rb'),
            recipients=recipients,
            armor=True,                                         # Output as ASCII text.
            always_trust=True,
            output=out_file
        )
        log.debug(f'{file} encrypted as {cipherfile}.')
    except BaseException as err:
        log.exception('Unhandled exception occured.')
        print(f'Encryption failed for {file}.')
        raise err

    return out_file


def munge_cipherfile(cipherfile: pathlib.PosixPath):
    '''Add lines to cipherfile needed for shell interpretation.'''
    newlines = [                                                # Cleartext header.
        '#!/bin/env bash\n',                                    # Shebang.
        'gpg2 --decrypt 2> /dev/null << EOF | bash -s $@\n',    # Decrypt cipher heredoc and pipe to subshell.
    ]
    st = os.stat(cipherfile)                                    # Get the file mode.

    newlines.extend(open(cipherfile, 'r').readlines())          # Add ciphertext to header.
    newlines.extend(['EOF'])                                    # Append footer to header+ciphertext.
    os.chmod(cipherfile, st.st_mode | 0o111)                    # Make file executable.

    with open(cipherfile, 'w') as fh:
        fh.writelines(newlines)                                 # Write header/ciphertext/footer to file.


if __name__ == '__main__':
    args = get_arguments()
    gpg = gnupg.GPG(
        gpgbinary='/usr/bin/gpg2',
        use_agent=True,
        verbose=False
    )

    munge_arguments(args)

    if prechecks_pass(args):
        for clearfile in args.file:
            cipherfile = encrypt(clearfile, args.recipients)
            munge_cipherfile(cipherfile)
            print(
                f'{clearfile} encrypted. '
                'You may now delete the original, if it still exists.'
            )
