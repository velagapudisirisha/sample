pipeline {
    agent 'any'
    tools {
       jdk 'jdk8'
       maven 'maven3'
    }
    stages {
        stage('git'){
            steps {
                echo 'this tage is for pulling code from gti repo'
                git 'https://gitlab.com/jagarlamudirajesh34/kubernetes_we.git'
            }
        }
        stage('maven'){
            steps {
                echo 'this stage is for Building App'
                sh 'mvn clean'
                sh 'mvn install'
            }
        }
        stage('tomcat'){
            steps {
                echo 'this stage is for deploying app into tomcat'
                sh 'ansible-playbook tomcat
                sh 'mvn install'
            }
        }
    }
    
}
