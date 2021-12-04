pipeline {
    agent 'any'
    tools {
        jdk 'jdk1.8'
        maven 'maven3'
    }
    stages {
        stage('git repo'){
            steps{
                git 'https://gitlab.com/jagarlamudirajesh34/kubernetes_we.git'
            }
        }
        stage('maven'){
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
                              "pattern": "/var/lib/jenkins/.m2/repository/com/srish/mvn-hello-world/1.4/mvn-hello-world-1.4.war",
                              "target": "AppRepo/"
                            }
                                ]
                    }"""
	                server.upload(uploadSpec)
	            }
	          }
	        }
            stage('build Doc Image & push'){
                steps{
                    sh 'docker build -t app:1 .'
                    sh ' $(aws ecr get-login --no-include-email)'
                    sh 'docker tag app:1 480756542354.dkr.ecr.ap-south-1.amazonaws.com/app:latest'
                    sh 'docker push 480756542354.dkr.ecr.ap-south-1.amazonaws.com/app:latest'
                }
            }
            stage('ansible play'){
                steps{
                    sh 'ansible-playbook ansibleplaybook.yaml --syntax-check'
                    sh 'ansible-playbook ansibleplaybook.yaml'
                }
            }
    }
}
