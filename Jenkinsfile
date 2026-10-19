pipeline {
    agent any

    environment {
        STUDENT_NAME = 'YourName'
        STUDENT_SURNAME = 'YourSurname'
        STUDENT_GROUP = 'YourGroup'
        STUDENT_ID = 'YourID'
        IMAGE_NAME = 'your-surname-your-name-devops'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
                sh 'echo "Source code checked out"'
            }
        }
        stage('Build') {
            steps {
                sh 'python3 -m py_compile app/main.py'
            }
        }
        stage('Test') {
            steps {
                sh 'python3 app/main.py'
            }
        }
        stage('Docker Build') {
            steps {
                sh 'docker build -t ${IMAGE_NAME} .'
            }
        }
        stage('Docker Run') {
            steps {
                sh 'docker run --rm -e STUDENT_NAME="${STUDENT_NAME}" -e STUDENT_SURNAME="${STUDENT_SURNAME}" -e STUDENT_GROUP="${STUDENT_GROUP}" -e STUDENT_ID="${STUDENT_ID}" ${IMAGE_NAME}'
            }
        }
    }
    post {
        always {
            echo 'Pipeline execution finished. Check stage results above.'
        }
    }
}
