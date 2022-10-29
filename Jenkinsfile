pipeline {
    agent 'any'
     tools {
         jdk 'jdk11'
         mvn 'maven3'
     }
     stages {
         stage('git'){
             steps{
                 echo 'This stage for git code pull'
                 git 'https://gitlab.com/jagarlamudirajesh34/kubernetes_we.git'
             }
         }
     }


}
