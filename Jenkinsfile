pipeline {
    agent 'any'
    tools {
        jdk 'jdk1.8'
        maven 'maven3'
    }

    stages {
        stage('git'){
            steps {
                echo 'Pull SRC code from GIT Repo Kubernetes_WE --> https://gitlab.com/jagarlamudirajesh34/kubernetes_we.git'
                git 'https://gitlab.com/jagarlamudirajesh34/kubernetes_we.git'
            }
        }
        stage('test'){
            steps {
                echo 'test service'
            }
        }
    }
}
