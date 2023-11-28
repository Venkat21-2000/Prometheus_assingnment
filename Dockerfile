FROM python:3.10

RUN pip install prometheus-client 
RUN pip install flask
RUN pip install boto3 python-decouple psutil
RUN pip install awscli --upgrade --user

ENV AWS_ACCESS_KEY_ID=AKIA4KYJXNXWQGA6H6UH
ENV AWS_SECRET_ACCESS_KEY=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

COPY . /app

WORKDIR /app

EXPOSE 5000

ENTRYPOINT FLASK_APP=/app/app.py flask run --host=0.0.0.0