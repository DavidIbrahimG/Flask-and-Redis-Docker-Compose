# Simple Flask and Redis Application with Docker Compose

## Overview
This project demonstrates how to run a simple **Flask** web application and a **Redis** container together using **Docker Compose**. The Flask app increments a counter stored in Redis each time it is accessed, showcasing the power of running multiple containers together.

## Features
- **Flask** app with a single route (`/`) that returns "Hello, World!" and the number of times the page has been accessed.
- **Redis** is used to store and increment the "hits" count.
- **Docker Compose** is used to run both the Flask and Redis containers together.

## Setup and Running Locally
1. **Clone the repository**:  
   ```bash  
   git clone <repo-url>  
   cd <repo-directory>  


### Use python 3.7 alpine as the base image
    FROM python:3.7-alpine

### Set the working directory in the container
    WORKDIR /app

### Set environment variables for Flask
    ENV FLASK_APP=app.py
    ENV FLASK_RUN_HOST=0.0.0.0

### Install dependencies: build tools and required libraries for running Flask and Redis
    RUN apk update && apk add --no-cache gcc musl-dev libffi-dev

### Copy the current directory contents into the container at /app
    COPY . .

### Install Python dependencies
    RUN pip install --no-cache-dir -r requirements.txt

### Expose port 5000 for Flask
    EXPOSE 5000

### Run Flask when the container starts
    CMD ["flask", "run"]


### 2. Build and start the containers using Docker Compose:
    docker-compose up --build

### 3. Open a browser and navigate to http://127.0.0.1:8000/. You should see the message:
    Hello World! I have been seen X times.
The number X will increment every time you refresh the page.

## Directory Structure
.
├── app.py
├── Dockerfile
├── docker-compose.yml
└── requirements.txt

## Conclusion:
This project demonstrates how to run a Flask app and a Redis service in isolated containers using Docker Compose. It’s a great example of how to use Docker for web application deployment with state management via Redis.


## Explanation:
- **Docker Compose** manages the **Flask** and **Redis** containers, and the **Flask** app connects to **Redis** to increment the hit count.
- The **Dockerfile** builds the **Flask** container, and **docker-compose.yml** defines the services.
- The **requirements.txt** includes the necessary Python dependencies.

