FROM python:3.8-slim
RUN pip3 install --upgrade pip
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
COPY src src
EXPOSE 5000
CMD ["python3", "src/main.py"]
