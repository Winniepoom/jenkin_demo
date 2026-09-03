pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
    }
    stages [
        stage('Test') {
            steps {
                sh 'echo "Running tests..."'
                sh 'pytest tests/'
            }
        }
    ]
    
    stages {
        stage('Build') {
            steps {
                sh 'echo "Building the application..."'
                docker build -t product-demo .
                docker run --rm product-demo
            }
        }
    }
}