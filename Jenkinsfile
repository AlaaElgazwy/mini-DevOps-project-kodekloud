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
                    
                    def customTag = "${env.BUILD_NUMBER}"
                    echo "Building image ${DOCKER_IMAGE_REPO}:${customTag}"
                    
                
                    def builtImage = docker.build("${DOCKER_IMAGE_REPO}:${customTag}", ".")
                    
                    
                    builtImage.tag("latest") 
                    
                    
                    env.BUILT_IMAGE_TAG = builtImage.id
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    
                    withDockerRegistry(credentialsId: "${DOCKER_CREDENTIALS_ID}", url: 'https://registry.hub.docker.com') {
                        
                        def imageToPush = docker.image("${DOCKER_IMAGE_REPO}")
                        
                        
                        imageToPush.push("${env.BUILD_NUMBER}")
                        
                        
                        imageToPush.push("latest")
                    }
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