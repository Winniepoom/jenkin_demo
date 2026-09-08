pipeline {
    agent any
    environment {
            ECR_URI = "458818121281.dkr.ecr.ap-southeast-1.amazonaws.com"
    }
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
                    sh "docker build -t ${ECR_URI}/product-demo:${env.IMAGE_TAG} ."
                }
            }
        }
        stage('smoke test') {
            steps {
            sh "docker run -d --name smoke-${env.BUILD_NUMBER} -p 8081:8080 ${ECR_URI}/product-demo:${env.IMAGE_TAG}"
            sh 'curl -s http://localhost:8081 | grep "Hello from the product demo!"'
            sh "docker rm -f smoke-${env.BUILD_NUMBER}"            }
        }
        #te
        stage('Push') {
            when { branch 'main' }
            steps {
            withCredentials([usernamePassword(credentialsId: 'ecr-ci-key',  
                    usernameVariable: 'AWS_ID', passwordVariable: 'AWS_SECRET')]) {
                sh '''
                export AWS_ACCESS_KEY_ID="$AWS_ID"
                export AWS_SECRET_ACCESS_KEY="$AWS_SECRET"
                aws ecr get-login-password --region ap-southeast-1 | docker login "$ECR_URI" --username AWS --password-stdin
                docker push "$ECR_URI/product-demo:$IMAGE_TAG"
                '''
            }
    }
}
    }
}