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
         stage('mvn build'){
             steps{
                 echo 'mvn clean and install step is executing'
                 sh 'mvn clean'
                 sh 'mvn install'
             }
         }
     }

}
