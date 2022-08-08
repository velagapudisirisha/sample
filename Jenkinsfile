pipeline {
    agent any
    tools {
        jdk 'jdk1.8'
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
                              "pattern": "/var/lib/jenkins/.m2/repository/com/srish/mvn-hello-world/1.7/mvn-hello-world-1.7.war",
                              "target": "TestRepo/"
                            }
                                ]
                    }"""
	                server.upload(uploadSpec)
	            }

            }
        }
        stage('docker img'){
            steps{
                echo "docker image building"
                sh 'docker -v'
                sh 'docker build -t app:1  .'
            }
        }
        stage('aws ecr'){
            steps{
                echo "push docker image to AWS ECR"
                sh '$(aws ecr get-login --no-include-email)'
                sh 'docker tag app:1 018479218481.dkr.ecr.ap-south-1.amazonaws.com/app:1'
                sh 'docker push 018479218481.dkr.ecr.ap-south-1.amazonaws.com/app:1'
            }
        }
    }
}
