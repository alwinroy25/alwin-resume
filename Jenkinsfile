pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/yourusername/alwin-resume.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t alwin-resume .'
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                script {
                    sh 'kubectl apply -f k8s/deployment.yaml'
                }
            }
        }
    }
}