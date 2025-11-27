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

        stage('Docker Build') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Kubernetes Deploy') {
            steps {
                sh 'kubectl apply -f maven-web-app-deploy.yml'
            }
        }
    }
}
