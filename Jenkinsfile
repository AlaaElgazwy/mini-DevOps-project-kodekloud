pipeline {
    agent any 
    environment {
        
        DOCKER_IMAGE = "alaaelgazwy/django-app" 
        DOCKER_CREDENTIALS_ID = "dockerhub" 
    }

    stages {
        stage('Checkout Code') {
            steps {
                
                git branch: 'main', url: 'https://git@github.com:AlaaElgazwy/mini-DevOps-project-kodekloud.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    
                    def customTag = "${env.BUILD_NUMBER}"
                    
                    docker.build("${DOCKER_IMAGE}:${customTag}", '.')
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
            
                    withDockerRegistry(credentialsId: "${DOCKER_CREDENTIALS_ID}", url: 'https://registry.hub.docker.com') {
                        def image = docker.image("${DOCKER_IMAGE}")
                        
                        image.push("${env.BUILD_NUMBER}")
                        
                        image.push("latest")
                    }
                }
            }
        }
    }
}