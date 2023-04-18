pipeline {
    agent any 

environment {
        SONAR_LOGIN = credentials('sonar_login')
    } 

stages {
        stage('Checkout') {
            steps {
                // Checkout your code from version control system
                script{
                    checkout([$class: 'GitSCM' , branches: [[name: '*/master']] ,
                       userRemoteConfigs: [[
                           url :'https://github.com/soulaymenkammoun/fast-apis.git']]])
                }
            }
        }
        stage('Build') {
            steps {
                script{
                // Install the required dependencies
                sh 'pip install -r requirements.txt'
            }
            }
                
        }
        stage('Test') {
            steps {
                script{
                // Run the tests
                sh 'pytest tests/'
            }
                }
        }
         stage('SonarQube Analysis') {
            steps {
                 script{
                sh 'docker run -d -p 9000:9000 sonarqube:8.9.7-community'
                sh 'mvn sonar:sonar -Dsonar.host.url=http://localhost:9000 -Dsonar.login=${env.SONAR_LOGIN}'
            }
                }
        }
     post {
        always {
            sh 'docker stop $(docker ps -aqf "ancestor=sonarqube:8.9.7-community")'
        }
        }
        }
}
