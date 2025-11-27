pipeline {
    agent any
    
    tools {
        maven 'Maven 3.9.6'
    }
    
    environment {
        IMAGE_NAME = "rakesh/mavenwebapp:${BUILD_NUMBER}"
        DOCKER_TAG = "rakesh/mavenwebapp:latest"
    }
    
    stages {

        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/rakesh94452/maven-web-app.git'
            }
        }
        
        stage('Maven Build') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }
        
        stage('Docker Build') {
            steps {
                script {
                    sh "docker build -t ${IMAGE_NAME} ."
                    sh "docker tag ${IMAGE_NAME} ${DOCKER_TAG}"
                }
            }
        }
        
        stage('Kubernetes Deployment') {
            steps {
                sh 'kubectl apply -f maven-web-app-deploy.yml'
                sh 'kubectl get pods'
                sh 'kubectl get svc'
            }
        }
    }
    
    post {
        always {
            sh 'docker system prune -f'
        }
        success {
            echo '🎉 Pipeline completed successfully!'
        }
        failure {
            echo '❌ Pipeline failed!'
        }
    }
}
