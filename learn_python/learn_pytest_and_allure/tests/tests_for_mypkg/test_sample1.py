from mypkg.blob import Blob
from tests.utils import help_functions
import pytest


def test_blob():
    assert Blob.say_hi() == "Hi"
    assert Blob.say_bye() == "Bye"


def test_mytest():
    with pytest.raises(SystemExit):
        help_functions.f()


def test_answer():
    assert help_functions.inc(3) == 5


# content of test_class.py
class TestClass(object):
    def test_one(self):
        x = "this"
        assert 'h' in x

    def test_two(self):
        x = "hello"
        assert hasattr(x, 'check')


# content of test_tmpdir.py
def test_needsfiles(tmpdir):
    print (tmpdir)
    assert 0