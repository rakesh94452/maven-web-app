pipeline {
    agent any

    tools {
        maven 'Maven 3.9.9'
    }

    environment {
        IMAGE_NAME = "rakesh/mavenwebapp:latest"
    }

    stages {

        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/rakesh94452/maven-web-app.git'
            }
        }

        stage('Maven Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-login',
                 usernameVariable: 'DOCKER_USER',
                 passwordVariable: 'DOCKER_PASS')]) {
                    sh '''
                    docker login -u $DOCKER_USER -p $DOCKER_PASS
                    docker push $IMAGE_NAME
                    '''
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl apply -f maven-web-app-deploy.yml'
                sh 'kubectl rollout status deployment/maven-web-app'
            }
        }
    }
}
