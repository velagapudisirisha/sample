pipeline {
    agent 'any'
     tools {
         jdk 'jdk11'
         maven 'maven3'
     }
     stages {
         stage('git'){
             steps{
                 echo 'This stage for git code pull'
                 git 'https://gitlab.com/jagarlamudirajesh34/kubernetes_we.git'
             }
         }
         stage('Maven'){
             steps{
                 echo 'This stage for Maven clean and build'
                 sh 'mvn clean'
                 sh 'mvn install'                 
             }
         }
     }


}
