pipeline {
   agent 'any'
   tools {
       jdk 'jdk8'
       maven 'maven3'
   }   
   stages {
       stage('git'){
           steps{
               echo 'pulling code from git repos'
               git 'https://gitlab.com/jagarlamudirajesh34/kubernetes_we.git'
           }
       }
       stage('maven'){
           steps{
               echo 'Maven cleand and build process'
               sh 'mvn clean'
               sh 'mvn install'
           }
       }
       stage('Ansible-App'){
           steps{
               echo 'Application servers to deploy'
               sh 'ansible-playbook ansible_playbook.yaml --syntax-check'
               sh 'ansible-playbook ansible_playbook.yaml'
           }
       }
       stage('Docker-image'){
           steps{
               echo 'Building docker image and push to AWS ECR'
               sh 'docker -v'
               sh 'docker build -t app:1 .'
               sh 'docker tag app:1 065792359805.dkr.ecr.ap-south-1.amazonaws.com/app:latest'
               sh 'docker push 065792359805.dkr.ecr.ap-south-1.amazonaws.com/app:latest'
           }
       }
   }

}
