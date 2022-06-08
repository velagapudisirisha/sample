pipeline {
    agent any
    tools {
        jdk 'jdk1.8'
        maven 'maven3'
    }
    stages {
        stage('git pull'){
           steps{
             echo "GIT SRC code pull"
             git ''
           }
        }
         stage('Maven build'){
           steps{
               echo "Maven clean and build"
               sh 'mvn clean'
               sh 'mvn install'
           }
        }
    }
}
