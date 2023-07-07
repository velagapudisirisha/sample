pipeline {
  agent 'any'
  tools {
     jdk 'jdk1.8'
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
    
      
                
     
    }



}
