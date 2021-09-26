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
          stage('Deploy Artifacts') { 
             steps {
                script {			 
                     def server = Artifactory.server 'myjfrog' 
                     def uploadSpec = """{
                       "files": [
                            {
                              "pattern": "/var/lib/jenkins/.m2/repository/com/srish/mvn-hello-world/1.3/mvn-hello-world-1.3.war",
                              "target": "TestRepo/"
                            }
                                ]
                    }"""
	                server.upload(uploadSpec)
	            }
	          }
	        }
         stage('docker build'){
             steps{
                 echo 'docker build'
                 sh 'docker --version'
                 sh 'docker build -t myapp:1 .'
             }
         }
         stage('push to ECR'){
             steps{
                 sh '$(aws ecr get-login --no-include-email)'
                 sh 'docker tag myapp:1 899197664719.dkr.ecr.us-east-1.amazonaws.com/myapp:latest'
                 sh 'docker push 899197664719.dkr.ecr.us-east-1.amazonaws.com/myapp:latest'
             }
         }
     }

}
