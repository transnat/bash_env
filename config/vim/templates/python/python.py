#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# Author:       Casey Sparks
# Date:         x
# Description:
'''
The description of the script goes here.
'''

import argparse
import logging
import pathlib
from locale import setlocale, LC_ALL


setlocale(LC_ALL, 'en_US.UTF-8')                        # Set locale.


def get_arguments() -> argparse.Namespace:
    '''Get cmdline arguments.'''
    parser = argparse.ArgumentParser(                               # Instantiate argument parser.
        description='The `help()` description of the application goes here.'
    )
    parser.add_argument(                                            # Log to file.
        '--logfile',
        dest='logfile',
        type=pathlib.Path,
        help='Absolute path to write the logfile to.'
    )
    parser.add_argument(                                            # Enable DEBUG logging.
        '--verbose', '-v',
        action='store_const',
        dest='loglevel',
        const=logging.DEBUG,
        default=logging.INFO,
        help='Set log level to DEBUG.'
    )

    return parser.parse_args()


def enable_logging(
    args: argparse.Namespace
        ) -> logging.RootLogger:
    '''
    Enable logging and handle outputs.
        :param args:    User-specified commandline arguments.
    '''
    # Root logger/formatter
    formatter = logging.Formatter(                                  # Useful format header.
        '%(asctime)s '
        '[%(threadName)-12.12s] '
        '[%(levelname)-5.5s] '
        '%(message)s'
    )
    root_logger = logging.getLogger()                               # Root logger class.

    # Console logger.
    log_console = logging.StreamHandler()                           # Log to screen.

    log_console.setFormatter(formatter)                             # No format header for console log.
    root_logger.addHandler(log_console)                             # Add console to root logger.

    # File logger.
    if args.logfile:
        log_file = logging.FileHandler(args.logfile)                # Log to file.

        log_file.setFormatter(formatter)                            # Verbose format header for logfile.
        root_logger.addHandler(log_file)                            # Add logfile to root logger.

    root_logger.setLevel(args.loglevel)                             # User-specified loglevel.

    return root_logger


if __name__ == '__main__':
    args = get_arguments()                                          # Get cmdline arguments.
    log = enable_logging(args)                                      # Enable logging.
