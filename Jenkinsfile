pipeline {
    agent 'any'
    tools {
        jdk 'jdk1.8'
        maven 'maven3'
    }

    stages{
        stage('git pull'){
            steps{
                echo 'code pull from https://gitlab.com/jagarlamudirajesh34/kubernetes_we.git'
                git 'https://gitlab.com/jagarlamudirajesh34/kubernetes_we.git'
            }
        }
    }
}
