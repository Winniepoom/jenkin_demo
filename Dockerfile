FROM python:3.12-slim

WORKDIR /app
COPY product.py .
CMD ["python", "product.py"]