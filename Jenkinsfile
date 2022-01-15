pipeline {
    agent 'any'
    tools {
        jdk 'jdk1.8'
        maven 'maven3'
    }
    stages {
        stage('git pull'){
            steps{
                git 'https://gitlab.com/jagarlamudirajesh34/kubernetes_we.git'
            }
        }
        stage('mvn install'){
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
                    sh 'docker --version'
                    sh 'docker build -t app:1 .'
                    sh '$(aws ecr get-login --no-include-email)'
                    sh 'docker tag app:1 480756542354.dkr.ecr.ap-south-1.amazonaws.com/app:latest'
                    sh 'docker push 480756542354.dkr.ecr.ap-south-1.amazonaws.com/app:latest'
                }
            }
            stage('ansible'){
                steps{
                    sh 'ansible tag_Name_DE1 -m ping'
                    sh 'ansible-playbook myplaybook.yaml --syntax-check'
                    sh 'ansible-playbook myplaybook.yaml'
                }
            }
    }


    
}
