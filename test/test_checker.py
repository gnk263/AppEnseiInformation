import pytest
import json

class TestInformationJson(object):
    def get_json_data(self):
        with open('json/information.json') as f:
            return json.load(f)

    def test_exist_key(self):
        data = self.get_json_data()

        assert 'Message' in data
        assert 'DeadlineTimestamp' in data
        assert 'Period' in data

    def test_value_type(self):
        data = self.get_json_data()

        assert type(data['Message']) is str
        assert type(data['DeadlineTimestamp']) is int
        assert type(data['Period']) is int
