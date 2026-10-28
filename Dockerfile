FROM python:3.12-slim

WORKDIR /app

COPY data /app/data

RUN python -c "import os; print('Data files:', os.listdir('/app/data'))"

CMD ["python", "-c", "import os; print('TP04 Docker container started successfully'); print('Files:', os.listdir('/app/data'))"]
