pipeline {
    agent any
    environment {
        IMAGE_TAG = "alwin-resume:${BUILD_ID}"
    }
    stages {
        stage('Clone Repository') {
            steps {
                // Clean workspace before pulling fresh code
                deleteDir()
                git branch: 'master', url: 'https://github.com/alwinroy25/alwin-resume.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Force clean build (no cache)
                    sh "docker build --no-cache -t ${IMAGE_TAG} ."
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                script {
                    // Update the deployment.yaml with the correct image tag
                    sh """
                    sed -i 's|REPLACE_ME_WITH_IMAGE|${IMAGE_TAG}|g' k8s/deployment.yaml
                    kubectl apply -f k8s/deployment.yaml
                    """
                }
            }
        }
    }
}
