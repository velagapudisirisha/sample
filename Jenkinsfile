pipeline{
    agent any
    tools {
        jdk 'jdk1.8'
        maven 'maven3'
    }
    stages {
        stage('git pull'){
            steps{
                echo 'pull code form git repo'
                git 'https://gitlab.com/jagarlamudirajesh34/kubernetes_we.git'
            }
        }
        stage('maven build'){
            steps{
                echo 'maven clean build install'
                sh 'mvn clean'
                sh 'mvn install'
            }
        }
    }
     

}
