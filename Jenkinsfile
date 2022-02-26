pipeline {
   agent any
   tools {
       jdk 'jdk1.8'
       maven 'maven3'
   }
   stages{
       stage('pull git'){
           steps{
               git 'https://gitlab.com/jagarlamudirajesh34/kubernetes_we.git'
           }
       }
       stage('Maven'){
           steps{
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
                              "pattern": "/var/lib/jenkins/.m2/repository/com/srish/mvn-hello-world/1.5/mvn-hello-world-1.5.war",
                              "target": "Test/"
                            }
                                ]
                    }"""
	                server.upload(uploadSpec)
	            }
	          }
	        }
        stage('App Server'){
            steps{
                sh 'ansible app_servers -m ping'
                sh 'ansible-playbook app_servers.yaml --syntax-check'
                sh 'ansible-playbook app_servers.yaml'
            }
        }
        stage('docker'){
            steps{
                sh 'docker -v'
                sh 'docker build -t app:1 .'
                sh '$(aws ecr get-login --no-include-email)'
                sh 'docker tag app:1 480756542354.dkr.ecr.ap-south-1.amazonaws.com/app:latest'
                sh 'docker push 480756542354.dkr.ecr.ap-south-1.amazonaws.com/app:latest'
            }
        }
   }




}
