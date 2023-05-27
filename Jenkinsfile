pipeline {
  agent 'any'
  stages {
    stage('GIT'){
          steps{
              echo "to pull latst code"
              git 'https://gitlab.com/jagarlamudirajesh34/kubernetes_we.git'
          }
      }
      stage('Maven'){
          steps{
              echo "Maven Cleand and Build"
              sh 'mvn clean'
              sh 'mvn install'
          }
      }
       stage('Docker'){
          steps{
              echo "To build Docker image"
              sh 'docker -v'
              sh 'docker build -t app:1 .'     
              sh '$(aws ecr get-login --no-include-email)'
              sh 'docker tag app:1 952699092968.dkr.ecr.us-east-1.amazonaws.com/app:1' 
              sh 'docker push 952699092968.dkr.ecr.us-east-1.amazonaws.com/app:1'        
          }
      }
       
      
      
     
      
  }



}
