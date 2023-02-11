pipeline {
    agent any
    options { 
        timestamps()
        ansiColor('xterm')     
    }
    stages {
        stage('Compile and Package') {
            steps {
                sh './mvnw package'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }       
            }
        }
        stage('Validate Docker Compose Configuration') {
            steps {
                sh 'docker-compose config'
            }
        }
        stage('Build Docker Images') {
            steps {
                sh 'docker-compose build'
            }
        }
        stage('Start Docker Containers') {
            steps {
                sh '''
                docker-compose up -d
                docker-compose logs -t --tail=10
                '''
                echo '\033[1;32m[Success] Containers started successfully\033[0m'
            }
        }
    }
}

