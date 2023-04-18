pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
        SONAR_LOGIN = credentials('sonar-jenkins')
    }
    stages {
        
        stage('docker-compose Build') {
            steps {
                sh "docker-compose build"
            }
        }
        
        stage('Build') {
            steps {
                sh "docker build -t soulaymendocker123/fastapi:latest ."
            }
        }
        stage('Unit Tests') {
            steps {
                docker-compose run app sh -c "pytest tests/ --cov=app --cov-report=xml"
            }
            post {
                always {
                    junit 'tests/**/*.xml'
                }
            }
        }
        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('SonarQube') {
                    sh "mvn sonar:sonar -Dsonar.host.url=http://localhost:9000 -Dsonar.login=${env.SONAR_LOGIN}"
                }
            }
        }
        stage('Docker login') {
            agent any
            steps {
                sh 'echo "login Docker ...."'
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('Push Docker Image') {
            steps {
                sh "docker push soulaymendocker123/fastapi:latest"
            }
        }
    }
}
