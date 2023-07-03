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
              sh '$(aws ecr get-login --no-include-email)'
              sh 'docker tag app:1 540368896160.dkr.ecr.us-east-2.amazonaws.com/app1:latest'
              sh 'docker push 540368896160.dkr.ecr.us-east-2.amazonaws.com/app1:latest'
          }
      }
      stage('Docker Eng'){
          steps{
              echo "to connect to DE and pull Img start con"
              sh 'ansible-playbook docker_playbook.yaml --syntax-check'
              sh 'ansible-playbook docker_playbook.yaml'
          }
      }
      
                
     
    }



}
