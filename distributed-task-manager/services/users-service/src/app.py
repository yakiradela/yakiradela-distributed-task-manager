from flask import Flask
from routes import user_bp
from db import init_db 
from config import Config

app = Flask(__name__)
app.config.from_object(Config)

init_db(app)

app.register_blueprint(user_bp, url_prefix="/users")

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
    
