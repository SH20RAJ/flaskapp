# Use the official Python image as a base image
FROM python:3.9

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
# WORKDIR /app

# Copy the dependencies file to the working directory
COPY requirements.txt .

# FROM python:3.9

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY . .

# CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "7860"]

# Copy the rest of the application code to the working directory
# COPY . .

# Expose port 5000 (the port Flask runs on)
EXPOSE 7860

# Command to run the application
CMD ["python", "app.py"]
