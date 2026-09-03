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
                sh 'echo "Building the application..."'
                sh 'docker build -t product-demo .'
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