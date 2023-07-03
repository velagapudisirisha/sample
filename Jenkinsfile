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
              echo "to clean and build App"
              sh 'mvn clean'
              sh 'mvn install'
          }
      }
      stage('Tomcat'){
          steps{
              echo "to Install and start tomcat and deploy App"
              sh 'ansible-playbook tomcat_playbook.yaml --syntax-check'
              sh 'ansible-playbook tomcat_playbook.yaml'
          }
      }
      stage('Docker'){
          steps{
              echo "to Build Docker image and push to AWS ECR"
              sh 'docker build -t app:1 .'
              sh 'docker images'
          }
      }
      
                
     
    }



}
