from db import mongo

class TaskModel:
    @staticmethod
    def create_task(data):
        return mongo.db.tasks.insert_one(data):
    
    @staticmethod
    def get_tasks_by_username(username):
        return list(mongo.db.tasks.find({"owner": username}))
    
    @staticmethod
    def update_tasks(task_id, data):
        mongo.db.tasks.update_one({"id": task_id}, {"$set": data})

    @staticmethod
    def delete_task(task_id):
        mongo.db.tasks.delete_one({"id": task_id})    
