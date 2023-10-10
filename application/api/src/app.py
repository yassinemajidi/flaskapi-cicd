
from flask import Flask, request
from handlers import images, s3
import random

api = Flask(__name__)


@api.route('/api/health', methods=['GET'])
def get_health():
    return {"status": "ok"}


@api.route('/api/get-random-image', methods=['GET'])
def get_image():
    return {"image": images.get_image_url()}


@api.route('/api/upload-random-image', methods=['POST'])
def post_upload_random():
    image = images.get_image()
    random_number = str(random.randint(0, 9999))
    image_name = f'{random_number}.jpeg'

    s3.upload_to_s3(buffer=image, bucket='oper-qual-staging-327', object_name=image_name)
    return {"uploaded": "ok"}
