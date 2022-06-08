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
             git 'https://gitlab.com/jagarlamudirajesh34/kubernetes_we.git'
           }
        }
         stage('Maven build'){
           steps{
               echo "Maven clean and build"
               sh 'mvn clean'
               sh 'mvn install'
           }
        }
         stage('Deploy Artifacts') { 
            steps {
              script {			 
                def server = Artifactory.server 'myjfrog' 
                def uploadSpec = """{
                 "files": [
                  {
                    "pattern": "/var/lib/jenkins/.m2/repository/com/srish/mvn-hello-world/1.6/mvn-hello-world-1.6.war",
                    "target": "testrepo/"
                  }
                 ]
               }"""
	        server.upload(uploadSpec)
	        }
	       }
	     }
       stage ('ansible - app'){
         steps{
           sh 'ansible-playbook ansible_playbook.yaml --syntax-check'
           sh 'ansible-playbook ansible_playbook.yaml'
         }
       }
       stage('docker'){
         steps{
           sh 'docker build -t app:1 .'
           sh '$(aws ecr get-login --no-include-email)'
           sh 'docker tag app:1 303627538160.dkr.ecr.ap-south-1.amazonaws.com/app:latest'
           sh 'docker push 303627538160.dkr.ecr.ap-south-1.amazonaws.com/app:latest'
           sh 'ansible-playbook ansible_docker.yaml --syntax-check'
           sh 'ansible-playbook ansible_docker.yaml'
         }
       }





    }
}
