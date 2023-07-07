pipeline {
  agent 'any'
  tools {
     jdk 'java-1.8.0-openjdk'
     maven 'maven3'
  }
  stages {
    stage('GIT'){
          steps{
              echo "to pull latest code"
              git 'https://github.com/velagapudisirisha/sample.git'
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
              sh 'ansible-playbook tomcat-playbook.yaml --syntax-check'
              sh 'ansible-playbook tomcat-playbook.yaml'
          }
      }
       stage('Docker'){
          steps{
              echo "to Build Docker image and push to AWS ECR"
              sh 'docker build -t app:1 .'
              sh 'docker images'
              sh 'docker tag app1:latest 335116981063.dkr.ecr.ap-south-1.amazonaws.com/app1:latest'
              sh 'docker push 335116981063.dkr.ecr.ap-south-1.amazonaws.com/app1:latest'
          }
       }  
      
                
     
    }



}
