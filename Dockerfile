# Use python 3.7 alpine as the base image
FROM python:3.7-alpine

# Set the working directory in the container
WORKDIR /app

# Set environment variables for Flask
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

# Install dependencies: build tools and required libraries for running Flask and Redis
RUN apk update && apk add --no-cache gcc musl-dev libffi-dev

# Copy the current directory contents into the container at /app
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 5000 for Flask
EXPOSE 5000

# Run Flask when the container starts
CMD ["flask", "run"]
