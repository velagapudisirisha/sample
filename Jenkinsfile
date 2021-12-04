pipeline {
    agent 'any'
    tools {
        jdk 'jdk1.8'
        mvn 'maven3'
    }
    stages {
        stage('git repo'){
            steps{
                git 'https://gitlab.com/jagarlamudirajesh34/kubernetes_we.git'
            }
        }
        stage('maven'){
            steps{
                sh 'mvn clean'
                sh 'mvn install'
            }
        }
    }
}
