import jwt
from flask import current_app

def decode_token(token):
    try:
        payload = jwt.decode(token, current_app.config["SECRET_KEY"], algorithms=["HS256"])
        return payload["sub"]
    except:
        return None 
