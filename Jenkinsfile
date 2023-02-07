pipeline {
  agent any
  options { 
	ansiColor("xterm")
	timestamps() 
  }
  	
    stages {
	stage('Packaging') {
            steps {
                sh "./mvnw package -q"
                script {
                    def startTime = new Date().format("dd/MM/yyyy HH:mm:ss")
                    echo "\033[32mPackage finished at: ${startTime}\033[0m"
                }
		junit 'test.xml'

            }
        }

	stage('Build') {
            steps {
                sh "docker-compose build"
            	script {
                    	def startTime = new Date().format("dd/MM/yyyy HH:mm:ss")
                    	echo "\033[32mBuild finished at: ${startTime}\033[0m"
           	}
	    }		
	}
        stage('Deploy') {
            steps {
                sh "docker-compose up -d"
		script {
                    	def startTime = new Date().format("dd/MM/yyyy HH:mm:ss")
                    	echo "\033[32mUp finished at: ${startTime}\033[0m"
       		}            

            }
       }
    }
    post {
        always {
           	junit '**/target/*.xml'
        }
        failure {
           	echo "\033[33mFAILED\033[0m"
        }
    }
}
