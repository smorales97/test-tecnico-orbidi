# apps/simple-app2/main.py
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"Hello": "App2"}

@app.get("/app2")
def read_root():
    return {"Hello": "App2"}