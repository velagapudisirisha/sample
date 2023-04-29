pipeline {
  agent 'any'
  tools {
    jdk 'jdk1.8'
    maven 'maven3'
  }
  stages {
    stage('GIT'){
          steps{
              echo "to pull latst code"
              git 'https://gitlab.com/jagarlamudirajesh34/kubernetes_we.git'
          }
      }
       stage('Maven'){
          steps{
              echo "to Build Artifact"
              sh 'mvn clean'
              sh 'mvn install'
          }
      }
       stage('tomcat'){
          steps{
              echo "to Install and deploy app into tom"
              sh 'ansible-playbook tomcat_playbook.yaml --syntax-check'
              sh 'ansible-playbook tomcat_playbook.yaml'              
          }
      }
      stage('Docker'){
          steps{
              echo "to Build Image on Docker file"
              sh 'docker build -t app:1 .'
              sh 'docker tag app:1 836768678848.dkr.ecr.ap-south-1.amazonaws.com/app:latest'
              sh '$(aws ecr get-login --no-include-email)'
              sh 'docker push 836768678848.dkr.ecr.ap-south-1.amazonaws.com/app:latest'
              sh 'ansible-playbook docker_playbook.yaml --syntax-check'
               sh 'ansible-playbook docker_playbook.yaml'              
          }
      }
      
  }



}
