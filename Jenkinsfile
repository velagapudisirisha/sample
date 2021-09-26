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
                              "pattern": "/var/lib/jenkins/.m2/repository/com/srish/mvn-hello-world/1.2/mvn-hello-world-1.3.war",
                              "target": "TestRepo/"
                            }
                                ]
                    }"""
	                server.upload(uploadSpec)
	            }
	          }
	        }
     }

}
