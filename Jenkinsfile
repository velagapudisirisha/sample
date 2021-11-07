pipeline {
    tools {
        jdk 'jdk1.8'
        maven 'maven3'
    }
    stages{
        stage('pull code git'){
            steps{
                echo 'pulling code from git repo'
                git 'https://gitlab.com/jagarlamudirajesh34/kubernetes_we.git'
            }
        }
        stage('maven clean & install'){
            steps{
                echo 'maven clean & install'
                sh 'mvn clean'
                sh 'mvn install'
            }
        }
    }
}
