#!/bin/bash

git clone https://github.com/pallets/flask
cd flask/examples/tutorial
python3 -m venv venv
. venv/bin/activate
pip install -e ../..
pip install -e .
export FLASK_APP=flaskr
export FLASK_ENV=development
flask init-db
flask run -h '0.0.0.0' -p 5000