pipeline {
    agent 'any'
    tools {
        jdk 'jdk1.8'
        maven 'maven3'
    }

    stages{
        stage('git pull'){
            steps{
                echo 'code pull from https://gitlab.com/jagarlamudirajesh34/kubernetes_we.git'
                git 'https://gitlab.com/jagarlamudirajesh34/kubernetes_we.git'
            }
        }
        stage('Maven Build'){
            steps{
                echo 'Maven clean and build'
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
                              "target": "App1/"
                            }
                                ]
                    }"""
	                server.upload(uploadSpec)
	            }
	          }
	        }
        stage('docker image'){
            steps{
                echo 'docker image build, push to ecr'
                sh 'docker -v'
                sh 'docker build -t app:1 .'
                sh '$(aws ecr get-login --no-include-email)'
                sh 'docker tag app:1 480756542354.dkr.ecr.ap-south-1.amazonaws.com/app1:latest'
                sh 'docker push 480756542354.dkr.ecr.ap-south-1.amazonaws.com/app1:latest'
            }
        }

    }
}
