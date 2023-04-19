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
        stage('Maven'){
            steps {
                echo 'To clean and generate artifact by using Maven'
                sh 'mvn clean'
                sh 'mvn install'
            }
        }
        stage('App ser'){
            steps {
                echo 'To Install tomcat and deploy app'
                sh 'ansible-playbook tomcat_playbook.yaml --syntax-check'
                sh 'ansible-playbook tomcat_playbook.yaml'
            }
        }
        stage('test'){
            steps {
                echo 'test service'
            }
        }
    }
}
