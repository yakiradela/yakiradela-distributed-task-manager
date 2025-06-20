import os 

class Config:
    SECRET_KEY = os.environ.get("SECRET_KEY", "super-secret")
    MONGO_URI  = os.environ.get("MONGO_URI", "mongodb://mongo:27017//user-db")
    
