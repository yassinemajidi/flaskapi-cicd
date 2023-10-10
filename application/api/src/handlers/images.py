import requests
from PIL import Image
from io import BytesIO

def get_image_url(w=300,h=200):
    """
    Returns a random image URL from Lorem Picsum.
    """
    return "https://picsum.photos/"+str(w)+"/"+str(h)


def get_image(w=300,h=200):
    """
    Fetches the image from the URL provided by `get_image_url` and returns it in a format suitable for uploading to S3.
    In this example, we're fetching the image and saving it to a BytesIO buffer.
    """
    url = get_image_url(w,h)
    response = requests.get(url)
    
    # Check if the request was successful
    if response.status_code == 200:
        # Use PIL to open the image
        image = Image.open(BytesIO(response.content))

        # Save image to a BytesIO buffer and return
        buffer = BytesIO()
        image.save(buffer, format="JPEG")
        buffer.seek(0)
        return buffer
    else:
        raise Exception(f"Failed to fetch image from URL: {url}")
    
