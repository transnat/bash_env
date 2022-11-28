#!/usr/bin/env python3
# -*- coding:utf-8 -*-

from base64 import b64decode
from json import decoder, dumps, loads
from locale import setlocale, LC_ALL
from logging import getLogger, StreamHandler, INFO
from sys import argv
from typing import NoReturn


# Set logging, locale.
log = getLogger()

setlocale(LC_ALL, 'en_US.UTF-8')
log.addHandler(StreamHandler())
log.setLevel(INFO)


class LambdaHandler(object):
    def __init__(
        self,
        event: dict,
        context: dict
            ):
        self.context = context
        self.event = event
        self.query_params = dict()
        self.request_data = None
        self.response = None
        self.return_code = None

        self.munge_request(event, context)
        self.handle_request()

    def result(self) -> dict:
        '''Returns the return code and body of this class.'''
        return {'statusCode': self.return_code, 'body': dumps(self.response)}

    def munge_request(
        self,
        event: dict,
        context: dict
            ) -> NoReturn:
        '''
        Process an event.
            :param context:
            :param event:
        '''
        self.query_params = event.get('queryStringParameters', dict)
        self.is_base64_encoded = event.get('isBase64Encoded', False)

        request_body = event.get('body')

        if self.is_base64_encoded:
            request_data = b64decode(request_body)
        else:
            request_data = request_body

        try:
            request_body = loads(request_data)
        except (decoder.JSONDecodeError, TypeError):
            self.request_data = request_data
        else:
            self.request_data = request_body

    def handle_request(self) -> NoReturn:
        try:
            data = self.request_data
            self.response = self.set_casey(data)

        except Exception as err:
            self.return_code = 500
            self.response = {'error': str(err), 'received_data': self.request_data}
            raise err

        else:
            self.return_code = 200


def lambda_handler(
    context: dict,
    event: dict
        ):
    '''
    Default name used by Lambda.
        :param context:
        :param event:
    '''
    return LambdaHandler(event, context).result()


if __name__ == '__main__':
    event = dict()
    context = dict()

    try:
        file = argv[1]
    except IndexError:
        file = 'data.json'

    with open(file, 'r') as fh:
        event['body'] = fh.read()

    print(lambda_handler(event, context))
