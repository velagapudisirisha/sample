pipeline {
    agent any
    tools {
        java 'jdk1.8'
        maven 'maven3'
    }

    stages{
        stage('git'){
            steps {
                echo "this stage is for pulling code from git repo"
                git 'https://gitlab.com/jagarlamudirajesh34/kubernetes_we.git'
            }
        }
        stage('maven'){
            steps{
                echo "this stage is for Clean and build app"
                sh 'mvn clean'
                sh 'mvn install'
            }
        }
        stage('Jfrog'){
            steps{
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
    }
}
