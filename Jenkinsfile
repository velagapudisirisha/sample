pipeline {
  agent 'any'
  stages {
    stage('GIT'){
          steps{
              echo "to pull latst code"
              git 'https://gitlab.com/jagarlamudirajesh34/kubernetes_we.git'
          }
      }
      stage('TF'){
          steps{
              echo "to execute tf file"
              sh 'terraform init'
              sh 'terraform destroy -auto-approve'
          }
      }
      
                
     
    }



}
