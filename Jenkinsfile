pipeline {
    agent any

    environment {
        STUDENT_NAME = 'Amina'
        STUDENT_SURNAME = 'Sheraly'
        STUDENT_GROUP = 'IT2-2308'
        STUDENT_ID = '41544'
        IMAGE_NAME = 'amina-sheraly-devops'
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
