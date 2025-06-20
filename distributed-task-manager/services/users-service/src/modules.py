from db import mongo
from werkzeug.security import generate_password_hash, check_password_hash

class UserModel
    @staticmethod
    def create_user(username, password):
        hashed_pw = generate_password_hash(password)
        user_id = mongo.db.users.insert_one({
            "username": username,
            "password": hashed_pw
        }).inserted_id
        return str(user_id)

    @staticmethod
    def find_by_username(username):
        return mongo.db.users.find_one({"username": username}) 
    
    @staticmethod
    def verify_password(storted_password, input_password):
        return check_password_hash(storted_password, input_password)
