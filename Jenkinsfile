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
   }

}
