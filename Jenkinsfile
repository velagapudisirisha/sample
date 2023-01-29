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
                sh 'ansible-playbook tomcat_playbook.yaml --syntax-check'
                sh 'ansible-playbook tomcat_playbook.yaml'
            }
        }
        stage('docker'){
            steps {
                sh 'docker build -t app:1 .'
                sh '$(aws ecr get-login --no-include-email)'
                sh 'docker tag app:1 592300148445.dkr.ecr.ap-south-1.amazonaws.com/app:latest'
                sh 'docker push 592300148445.dkr.ecr.ap-south-1.amazonaws.com/app:latest'   
                sh 'ansible-playbook docker_playbook.yaml --syntax-check'
                sh 'ansible-playbook docker_playbook.yaml'
            }
        }
        stage('K8S'){
            steps {
                sh 'kubectl version --short --client'
                sh 'kubectl get nodes'
                sh 'kubectl apply -f deployment.yaml'
                sh 'kubectl apply -f service.yaml'
                sh 'kubectl get deployments'
                sh 'kubectl get pods'
                sh 'kubectl get services'   
            }
        }
    }
    
}
