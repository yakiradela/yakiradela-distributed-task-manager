from pydantic import BaseModel

class User(BaseModel):
    id: str
    username: str
    email: str 

class Task(BaseModel):
    id: str
    title: str 
    description: str
    status: str     
