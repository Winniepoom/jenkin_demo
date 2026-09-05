pipeline {
    agent any
    def tag = "${env.BUILD_NUMBER}-${env.GIT_COMMIT.take(7)}" — .take(7)
    stages {              // ONE stages block
        stage('Checkout') {
            steps { 
                checkout scm
            }
        }
        stage('Build') {
            steps { 
                sh 'echo "Building the application..."'
                sh 'docker build -t product-demo:${tag} .'
                sh 'docker run --rm product-demo'
            }
        }

            stage('smoke test') {
            steps { 
                sh 'echo "Running smoke tests..."'
                sh 'docker run --rm product-demo | grep "Hello from the product demo!"'
            }
        }
    }
}