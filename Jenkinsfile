pipeline {
    agent any
    stages {
        stage('Gut hub pull stage ') {
            steps {
                script{
                    checkout([$class: 'GitSCM' , branches: [[name: '*/master']] ,
                       userRemoteConfigs: [[
                           url :'https://github.com/soulaymenkammoun/reactapp.git']]])
                }
            }              
        }
        }
        
}
