# Use the official Python image as the base image
FROM python:3.9

# Set the working directory to /app
WORKDIR /app

# Copy the requirements file to the Docker image
COPY requirements.txt .

# Install the dependencies specified in the requirements file
RUN pip install -r requirements.txt

# Copy the rest of the files to the Docker image
COPY . .

# Specify the command to run when the Docker container starts
CMD ["uvicorn", "main:app", "--host", "127.0.0.1", "--port", "8000"]
