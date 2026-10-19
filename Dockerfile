FROM python:3.12-slim
WORKDIR /app
COPY app/ /app/
RUN python -m py_compile /app/main.py
ENV PYTHONDONTWRITEBYTECODE=1
CMD ["python", "/app/main.py"]
