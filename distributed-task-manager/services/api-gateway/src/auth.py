import jwt
from config import Config

def verify_token(token):
    if not token:
        return False
    try:
        jwt.decode(token.replace("Bearer ", ""), Config.SECRET_KEY, algorithms=["HS256"])
        return True
    except jwt.InvalidTokenError:
        return False
