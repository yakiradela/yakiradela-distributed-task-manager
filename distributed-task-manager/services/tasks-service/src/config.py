import os

class Config:
    SECERT_KEY = os.getenv("SECRET_KEY", "task-secret")
    MONGO_URI  = os.getenv("MONGO_URI", "mongo://mongo:27017/tasks-db")
    
