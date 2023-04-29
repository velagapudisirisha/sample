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
              git ''
          }
      }
      stage('test'){
          steps{
              echo "test stagee"
          }
      }
  }



}
