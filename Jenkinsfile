pipeline {
    agent any
    options { timestamps() 
	ansiColor('xterm')	
	}
    stages {
            stage('Comp') {
		steps {
                        sh './mvnw package'
                }
            }
            stage('Tests01') {
		steps {
                        junit 'target/surefire-reports/TEST-*.xml'
                }
            }
            stage('Docker config') {
		steps {
                        sh 'docker-compose config'
                }
            }
            stage('build') {
                steps {
                       sh 'docker-compose build'
                    }
                
            }
	        stage('Up') {
                steps {
                       sh '''docker-compose up -d
                       docker-compose logs -t --tail=10'''
                       
		       echo '\033[1;32m[Success] \033[0m'
                }
        }
        
    }
}
