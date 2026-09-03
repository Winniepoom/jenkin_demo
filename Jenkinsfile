pipeline {
    agent any
    stages {              // ONE stages block
        stage('Checkout') {
            steps { 
                checkout scm
            }
        }
        stage('Test') {
            steps { 
                sh 'echo "Running tests..."'
                sh 'pytest tests/'
            }
        }
        stage('Build') {
            steps { 
                sh 'echo "Building the application..."'
                sh 'docker build -t product-demo .'
                sh 'docker run --rm product-demo'
            }
        }
    }
}