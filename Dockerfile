FROM python:3.8-slim
RUN pip3 install --upgrade pip
ADD requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
ADD src src
ENTRYPOINT ["python3",  "src/main.py"]
