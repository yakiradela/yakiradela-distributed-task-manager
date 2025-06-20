from flask import Flask
from routes import tasks_bp
from db import init_db 
from config import Config

app = Flask(__name__)
app.config.from_object(Config)
init_db(app)
app.register_blueprint(tasks_bp, url_prefix="/tasks")

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
