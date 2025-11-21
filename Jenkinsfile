pipeline {
    
    agent any 

    environment {
        
        DOCKER_IMAGE_REPO = "alaaelgazwy/django-app" 
        DOCKER_CREDENTIALS_ID = "dockerhub" 
    }

    stages {
        
        stage('Build Docker Image') {
            steps {
                script {
                    
                    sh "apt-get update"
                
                    sh "apt-get install -y docker.io"

                    def customTag = "${env.BUILD_NUMBER}"
                    echo "Building image ${DOCKER_IMAGE_REPO}:${customTag}"

                
                    sh "docker build -t ${DOCKER_IMAGE_REPO}:${customTag} ."

                
                   sh "docker tag ${DOCKER_IMAGE_REPO}:${customTag} ${DOCKER_IMAGE_REPO}:latest"

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
        
        
        stage('Clean Up') {
            steps {
                echo "Cleaning up local images on the agent..."
                
                sh "docker rmi -f ${DOCKER_IMAGE_REPO}:${env.BUILD_NUMBER}"
                sh "docker rmi -f ${DOCKER_IMAGE_REPO}:latest"
            }
        
        }
        } 

}