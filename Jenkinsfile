pipeline {
   agent 'any'
   tools {
       jdk 'jdk8'
       maven 'maven3'
   }   
   stages {
       stage('git'){
           steps{
               echo 'pulling code from git repos'
               git ''
           }
       }
   }

}
