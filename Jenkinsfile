pipeline {
    agent any
    stages {              // ONE stages block
    
        stage('Checkout') {
            steps { 
                checkout scm
            }
        }
        stage('Build') {
            steps {
                script {
                    env.IMAGE_TAG = "${env.BUILD_NUMBER}-${env.GIT_COMMIT.take(7)}"
                    sh "docker build -t product-demo:${env.IMAGE_TAG} ."
                }
            }
        }
        stage('smoke test') {
            steps {
                sh "docker run --rm product-demo:${env.IMAGE_TAG} | grep 'Hello from the product demo!'"
            }
        }
    }
}