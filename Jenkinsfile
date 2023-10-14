pipeline {
    agent any

    tools {
        // Adding NodeJS Tool to help with installation of packages
        nodejs 'nodejs'
    }
    environment {
        // Referencing DockerHub Credentials from the Jenkins credentials
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
    }

    stages {
        stage('Install Packages') {
            steps {
                script {
                    sh 'npm install'
                }
            }
        }

        stage('Build Docker Image') {
            // Restricting branch to 'deploy'
            when {
                branch 'deploy'
            }
            steps {
                script {
                    sh 'docker build -t calebackom/monsters-rolodex .'
                }
            }
        }

        stage('Login') {
            // Restricting branch to 'deploy'
            when {
                branch 'deploy'
            }
            steps {
                script {
                    sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                }
            }
        }

        stage('Push to Docker Hub') {
            // Restricting branch to 'deploy'
            when {
                branch 'deploy'
            }
            steps {
                script {
                    sh 'docker push calebackom/monsters-rolodex'
                }
            }
        }

        stage('Deploy') {
            steps {
                sshagent (['my-name']) {
                    sh 'scp -o StrictHostKeyChecking=no deploy.sh ubuntu@ec2-54-246-26-146.eu-west-1.compute.amazonaws.com:~/'
                    sh 'ssh ubuntu@ec2-54-246-26-146.eu-west-1.compute.amazonaws.com "chmod +x deploy.sh"'
                    sh 'ssh ubuntu@ec2-54-246-26-146.eu-west-1.compute.amazonaws.com ./deploy.sh'
                }
            }
        }
    }

    post {
        always {
            sh 'docker logout'
        }
    }
}