# Base image
FROM python:3.8-slim-buster

RUN apt-get update && apt-get install -y gcc libc-dev \
    && pip install --upgrade pip \
    && pip install pytest \
    && pip install pytest-cov \
    && apt-get autoremove -y && apt-get clean -y

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application files
COPY . .

# Run the command to start the application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
