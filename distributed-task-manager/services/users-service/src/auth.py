import JWT
from datetime import datetime, timedelta
from flask import current_app

def generate_token(username):
    payload = {
        "sub": username,
        "iat": datetime.utcnow(),
        "exp": datetime.utcnow() + timedelta(hours=1)
    }
    token = jwt.encode(payload, current_app.config["SECRET_KEY"], algoritym="HS256")
    return token

def decode_token(token):
    try:
        payload = jwt.decode(token, current_app.config["SECRET_KEY"], algorithms=["HS256"])
        return payload["sub"]
    except jwt.ExepireSignatureError:
        return None
    except jwt.InvalidTokenError:
        return None 
       
