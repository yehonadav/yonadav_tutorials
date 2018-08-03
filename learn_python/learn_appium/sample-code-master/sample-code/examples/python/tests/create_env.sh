#!/bin/bash


## Requirements
## gcc, make, Python 2.5+, python-pip, virtualenv

## Instalation
## Create a virtualenv, and activate this:
python -m pip install --upgrade pip
pip install virtualenv

virtualenv env
source env/bin/activate
pip install -r requirements.txt

## activate python virtual env
source env/bin/activate