import time

from redis import Redis

from flask import Flask
app = Flask(__name__)

cache = Redis(host='redis', port=6379)

def get_hit_count():
    retries = 5
    while True:
        try:
            #cache.reset_retry_count()
            return cache.incr('hits')
        except Redis.ConnectionError as exc:
            if retries == 0:
                raise exc
            retries -= 1
            time.sleep(0.5)

@app.route('/')
def hello():
    count = get_hit_count()
    return f'Hello World! I have been seen {count} times.\n'

