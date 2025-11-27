pipeline {
    agent any
    
    tools {
        maven 'Maven 3.9.6'  // ✅ Matches your Global Tool config
    }
    
    environment {
        IMAGE_NAME = "rakesh/mavenwebapp:${BUILD_NUMBER}"  // ✅ Versioning
        DOCKER_TAG = "rakesh/mavenwebapp:latest"           // ✅ Latest tag
    }
    
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/rakesh94452/maven-web-app.git'  // ✅ Working
            }
        }
        
        stage('Maven Build') {
            steps {
                sh 'mvn clean package -DskipTests'  // ✅ Fast builds
            }
        }
        
        stage('Docker Build') {
            steps {
                script {
                    sh "docker build -t ${IMAGE_NAME} ."     // ✅ Build with version
                    sh "docker tag ${IMAGE_NAME} ${DOCKER_TAG}"  // ✅ Tag as latest
                }
            }
        }
        
        stage('Kubernetes Deploy') {
            steps {
                sh 'kubectl apply -f maven-web-app-deploy.yml'  // ✅ Fixed filename
                sh 'kubectl get svc -w'                         // ✅ Shows LB URL
            }
        }
    }
    
    post {
        always {
            sh 'docker system prune -f'  // ✅ Best practice cleanup [web:49][web:52]
        }
        success {
            echo '🎉 Pipeline completed successfully!'
        }
        failure {
            echo '❌ Pipeline failed!'
        }
    }
}
