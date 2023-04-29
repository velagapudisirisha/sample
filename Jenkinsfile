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
      stage('test'){
          steps{
              echo "test stagee"
          }
      }
  }



}
