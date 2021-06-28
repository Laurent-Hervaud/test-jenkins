pipeline {
    agent none
    stages {
        stage('Test') {
            agent {
                dockerfile true
            }
            steps {
                sh 'ls -rtl'
                sh 'aws --version'
                sh 'terraform --version'
            }
        }
    }
}