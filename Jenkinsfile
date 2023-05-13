pipeline {
  agent 'any'
  stages {
    stage('GIT'){
          steps{
              echo "to pull latst code"
              git 'https://gitlab.com/jagarlamudirajesh34/kubernetes_we.git'
          }
      }
      stage('Terraform'){
          steps{
              echo "to login to AWS Provider"
              sh 'aws s3 ls'
          }
      }
       
      
      
     
      
  }



}
