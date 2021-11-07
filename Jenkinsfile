pipeline {
    agent 'any'
    tools {
        jdk 'jdk1.8'
        maven 'maven3'
    }
    stages{
        stage('pull code git'){
            steps{
                echo 'pulling code from git repo'
                git 'https://gitlab.com/jagarlamudirajesh34/kubernetes_we.git'
            }
        }
        stage('maven clean & install'){
            steps{
                echo 'maven clean & install'
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
                              "pattern": "/var/lib/jenkins/.m2/repository/com/srish/mvn-hello-world/1.4/mvn-hello-world-1.4.war",
                              "target": "TestRepo/"
                            }
                                ]
                    }"""
	                server.upload(uploadSpec)
	            }
	          }
	    }
        stage('build docker image'){
            steps{
                echo 'build docker image'
                sh 'docker build -t app:1 .'
            }
        }
        stage('push to ECR'){
            steps{
                echo 'push image to ECR'
                sh '$(aws ecr get-login --no-include-email)'
                sh 'docker tag app:1 899197664719.dkr.ecr.ap-south-1.amazonaws.com/app:latest'
                sh 'docker push 899197664719.dkr.ecr.ap-south-1.amazonaws.com/app:latest'

            }
        }
    }
}
