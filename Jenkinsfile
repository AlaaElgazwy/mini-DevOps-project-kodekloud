pipeline {
    agent any 
    environment {
        
        DOCKER_IMAGE_REPO = "alaaelgazwy/django-app"
        DOCKER_CREDENTIALS_ID = "dockerhub" 
    }

    stages {
        stage('Checkout Code') {
            steps {
                
                git branch: 'main', url: 'https://github.com/AlaaElgazwy/mini-DevOps-project-kodekloud.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                   
                    def customTag = "${env.BUILD_NUMBER}"
                    echo "Building image ${DOCKER_IMAGE_REPO}:${customTag}"

                   sh """
            
                        apt-get update
                        apt-get install -y docker.io 
                        
                         
                        docker build -t ${DOCKER_IMAGE_REPO}:${customTag} .
                        docker tag ${DOCKER_IMAGE_REPO}:${customTag} ${DOCKER_IMAGE_REPO}:latest
                    """
                    
                    env.BUILT_IMAGE_TAG = "${DOCKER_IMAGE_REPO}:${customTag}"
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                     withCredentials([usernamePassword(credentialsId: "${DOCKER_CREDENTIALS_ID}", passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                    sh "docker login -u ${DOCKER_USERNAME} -p ${DOCKER_PASSWORD}"
                }

                
                   sh "docker push ${DOCKER_IMAGE_REPO}:${env.BUILD_NUMBER}"
                   sh "docker push ${DOCKER_IMAGE_REPO}:latest"
                    }
                }
            }
        }
    }
