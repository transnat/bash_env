#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# Author:       Casey Sparks
# Date:         November 15, 2022
# Description:
'''DESCRIPTION'''

workdir = 'WORKDIR'

from setuptools import setup, find_packages
from {DIRECTORY} import (
    __title__,
    __description__,
    __author__,
    __author_email__,
    __version__,
    __url__
)


setup(
    name=__title__,
    description=__description__,
    author=__author__,
    author_email=__author_email__,
    version=__version__,
    url=__url__,
    packages=find_packages(include=[
        workdir,
        f'{workdir}.*',
    ]),
    install_requires=[]
)

