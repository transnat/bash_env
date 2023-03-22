#!/usr/bin/env python3
# -*- coding:utf-8 -*-
# Date: March 20, 2023
# Description:
'''Run a simple local webserver.'''

__author__ = 'Casey Sparks'

from argparse import ArgumentParser, Namespace
from locale import setlocale, LC_ALL
from logging import getLogger, FileHandler, Formatter, RootLogger, StreamHandler
from pathlib import Path
from typing import Optional
from http import server
from socketserver import TCPServer
from sys import exit as sysexit

setlocale(LC_ALL, 'en_US.UTF-8')                                            # Set locale.


def get_arguments() -> Namespace:
    '''Get cmdline arguments.'''
    parser = ArgumentParser(description='Run a simple local webserver.')    # Instantiate argument parser.

    parser.add_argument(
        '--port', '-p',
        dest='port',
        type=int,
        default=8000,
        help='The port to run the webserver on. Default 8000'
    )
    parser.add_argument(                                                    # Set path for the output log file.
        '--logfile',
        dest='log_file',
        type=Optional[Path],
        default=None,
        help='Path to write the logfile to.'
    )
    parser.add_argument(                                                    # Set logging verbosity.
        '--verbose', '-v',
        dest='log_level',
        action='count',
        default=3,                                                          # Default NOTSET.
        help='Set log level. Default DEBUG.'
    )

    arguments = parser.parse_args()                                         # Parse arguments.
    arguments.log_level = max(50 - arguments.log_level * 10, 10)            # Log level should always be <=50,>=10.

    return arguments


def enable_logging(
    log_level: int = 30,                                                    # Default INFO.
    log_file_path: Optional[Path] = None
        ) -> RootLogger:
    '''
    Enable logging and handle outputs.
        :param log_level:   User-specified log level (10-50).
        :param log_file:    User-specified path to write log file.
    '''
    formatter = Formatter(                                                  # Log header.
          '{asctime} {threadName:12} {levelname:8}: "{message}"',           # Format style.
          style='{'                                                         # Set f-string style formating.
    )
    log_console = StreamHandler()                                           # Logging stream handler.
    log_root = getLogger()                                                  # Root logger class.

    log_console.setFormatter(formatter)                                     # Set log stream format.
    log_root.setLevel(log_level)                                            # User-specified log_level.
    log_root.addHandler(log_console)                                        # Log to screen.

    if log_file_path:                                                       # Logging file handler.
        log_file = FileHandler(log_file_path)

        log_file.setFormatter(formatter)                                    # Set log file format.
        log_root.addHandler(log_file)                                       # Log to file.

    return log_root


if __name__ == '__main__':
    args = get_arguments()
    log = enable_logging(args.log_level, args.log_file)
    http_server = TCPServer(
        ('', args.port),
        server.SimpleHTTPRequestHandler
    )

    with http_server as httpd:
        try:
            log.info(f'HTTP Server Serving at port: {args.port}')
            httpd.serve_forever()
        except KeyboardInterrupt:
            sysexit(1)
