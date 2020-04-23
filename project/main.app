from flask import Flask, render_template
from flask_script import Manager
import requests
app = Flask(__name__)
manager = Manager(app)

class ChuckNorris(object):


    @app.route('/')
    def get_jokes():
        url = 'https://api.chucknorris.io/jokes/random'
        response = requests.get(url)
        return response.json()['value']

