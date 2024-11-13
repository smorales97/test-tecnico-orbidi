# apps/simple-app1/main.py
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"Hello": "App1"}

@app.get("/app1")
def read_root():
    return {"Hello": "App1"}