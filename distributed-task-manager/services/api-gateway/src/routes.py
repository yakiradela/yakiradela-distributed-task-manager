from flask import request, jsonify
from config import Config
from utlis import forward_request
from auth import verify_token

def register_routes(app):

    @app.route("/users", methods=["GET"])
    def get_users():
        token = request.headers.get("Authorization")
        if not verify_token(token):
            return jsonify({"error ": "Unauthorized"}), 401
        response = forward_request("GET", f"{Config.USERS_SERVICE_URL}/users")
        return jsonify(response.json()), response.status_code
    
    @app.route("/tasks", methods=["POST"])
    def create_task():
        token = request.headers.get("Authorization")
        if not verify_token(token):
            return jsonify({"error": "Unauthorized"}), 401
        data = request.json
        response = forward_request("POST", f"{Config.TASKS_SERVICE_URL}/tasks", data=data)
        return jsonify(response.json()), response.status_code
    
