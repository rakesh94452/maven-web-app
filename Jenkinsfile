pipeline {
    agent any
    
    tools{
        maven 'Maven 3.9.9'
    }
    stages {
        stage('clone') {
            steps {
              git branch: 'main', url: 'https://github.com/rakesh94452/maven-web-app.git'
            }
        }
        stage('build'){
            steps{
                 sh 'mvn clean package'
            }
        }
        stage('docker image'){
            steps {
                sh 'docker build -t rakesh/mavenwebapp .'
            }
        }
        stage('k8s deploy'){
            steps{
               sh 'kubectl apply -f maven-wed-app-deploy-yml.yml'
            }
        }
    }
}



