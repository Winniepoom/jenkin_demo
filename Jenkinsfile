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
                    sh "docker build -t analatos/product-demo:${env.IMAGE_TAG} ."
                }
            }
        }
        stage('smoke test') {
            steps {
                sh "docker run --rm analatos/product-demo:${env.IMAGE_TAG} | grep 'Hello from the product demo!'"
            }
        }
        stage('Push') {
            steps {
                 withCredentials([string(credentialsId: 'dockerhub-token', variable: 'DH_TOKEN')]) {
                sh 'echo "$DH_TOKEN" | docker login -u analatos --password-stdin'
                sh "docker push analatos/product-demo:${env.IMAGE_TAG}"
        }
    }
}
    }
}