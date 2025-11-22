# 🚀 End-to-End DevOps Project: Django CI/CD Pipeline

## 🌐 Live Demo
Check out the live application here: **[Django App on Render](https://django-app-devops.onrender.com)**

---

## 📖 Project Overview
This project demonstrates a complete **DevOps lifecycle** for a Python Django application. The goal was to automate the build, test, and deployment process using a CI/CD pipeline built with **Jenkins** and **Docker**, culminating in a live deployment on **Render**.

It started as a challenge from **KodeKloud**, modified to use a more advanced stack (Django + Jenkins).

## 🛠️ Tech Stack
* **Source Code Management:** Git & GitHub
* **Web Framework:** Django (Python)
* **Containerization:** Docker & Docker Hub
* **CI/CD Automation:** Jenkins (running in Docker with DinD configuration)
* **Deployment:** Render (PaaS) via Deploy Hooks

## 🔄 The CI/CD Pipeline Workflow
The pipeline is defined in a declarative `Jenkinsfile` and performs the following steps automatically:

1.  **Checkout:** Pulls the latest code from the GitHub repository.
2.  **Build Image:** Creates a Docker image for the Django app, installing all dependencies.
3.  **Push:** Pushes the Docker image to **Docker Hub** with dynamic version tagging.
4.  **Deploy:** Triggers a Webhook to **Render** to pull the new image and update the live site immediately.


## 📸 Screenshots

### 1. Jenkins Pipeline (Success State)

![Jenkins Pipeline](/images/jenkins-pipline.png)

### 2. Docker Hub Repository

![Docker Hub](/images/docker-hub.png)

### 3. Live Application

![Live App](/images/django-app.png)

### render 
![On Render](/images/render.png)

## 💻 How to Run Locally

To run this project on your local machine using Docker:

```bash
# Clone the repository
git clone [https://github.com/AlaaElgazwy/mini-DevOps-project-kodekloud.git](https://github.com/AlaaElgazwy/mini-DevOps-project-kodekloud.git)

# Navigate to the directory
cd mini-DevOps-project-kodekloud

# Build the image
docker build -t alaaelgazwy/django-app:latest.

# Run the container
docker run -p 8000:8000 alaaelgazwy/django-app:latest
