pipeline{
     agent 'any'
     tools {
         jdk 'jdk1.8'
         maven 'maven3'
     }
     stages{
         stage('git pull'){
             steps{
                 git 'https://gitlab.com/jagarlamudirajesh34/kubernetes_we.git'
             }
         }
         stage('Maven clean and build'){
             steps{
                 sh 'mvn clean'
                 sh 'mvn install'
             }
         }
     }

}
