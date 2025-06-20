from flask import Blueprint, request, jsonify
from auth import decode_token
from models import TaskModel 
from bson import ObjectId

tasks_bp = Blueprint("tasks", __name__)

@tasks_bp.route("/", methods=["GET"])
def get_tasks():
    token = request.headers.get("Autorization", "").replace("Bearer", "")
    user = decode_token(token)
    if not user:
        return jsonify({"msg": "Invalid token"}), 401
    tasks = TaskModel.get_tasks_by_user(user)
    return jsonify([serialize_task(t) for t in tasks])

@tasks_bp.route("/", methods=["POST"])
def create_task():
    token = request.headers.get("Autorization", "").replace("Bearer ", "")
    user = decode_token(token)
    if not user:
        return jsonify({"msg": "Invalid token"}), 401
    data = request.get_json()
    data["owner"] = user
    tasks_id = TaskModel.craete_task(data)
    return jsonify({"msg": "Task created", "task_id": str(tasks_id)}), 201

def serialize_task(task):
    task["id"] = str(task["id"])
    return task
