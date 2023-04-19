pipeline {
    agent 'any'
    tools {
        jdk 'jdk1.8'
        maven 'maven3'
    }

    stages {
        stage('git'){
            steps {
                echo 'Pull SRC code from GIT Repo Kubernetes_WE'
            }
        }
        stage('test'){
            steps {
                echo 'test service'
            }
        }
    }
}
