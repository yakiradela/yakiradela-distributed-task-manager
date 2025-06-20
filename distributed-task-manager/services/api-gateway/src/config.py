import os

class Congif:
    USERS_SERVICE_URL = os.getenv("USERS_SERVICE_URL", "http://users-service")
    TASKS_SERVICE_URL = os.getenv("TASKS_SERVICE_URL", "http://tasks-service")
    SECRET_KEY = os.getenv("SECRET_KEY", "super-secret")
