from flask import Blueprint, request, jsonify
from models import UserModel 
from auth import generate_token, decode_token

user_bp = Blueprint("users", __name__)

@user_bp.route("/register", methods=["POST"])
def register():
    data = request.get_json()
    if UserModel.find_by_username(data["username"]):
        return jsonify({"msg": "User already exists"}), 400
    user_id = UserModel.create_user(data["username"], data["password"]) 
    return jsonify({"msg": "User created", "user_id": user_id}), 201

@user_bp.route("/login", methods=["POST"])
def login():
    data = request.get_json()
    user = UserModel.find_by_username(data["username"])
    if user and UserModel.verify_password(user["password"], data["password"]):
        token = generate_token(user["usrename"])
        return jsonify({"token": token})
    return jsonify({"msg": "Invalid credentials"}), 401   

@user_bp.route("/me", methods=["GET"])
def get_user():
    auth_header = request.headers.get("Autoorization", "")
    token = auth_header.replace("Bearer ", "")
    username = decode_token(token)
    if not username:
        return jsonify({"msg": "Invalid or expired token"}), 401
    user = UserModel.find_by_username(username)
    return jsonify({"username": user["username"]})
