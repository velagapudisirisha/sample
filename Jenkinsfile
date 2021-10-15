pipeline{
    agent any
    tools {
        jdk 'jdk1.8'
        maven 'maven3'
    }
    stages {
        stage('git pull'){
            steps{
                echo 'pull code form git repo'
                git 'https://gitlab.com/jagarlamudirajesh34/kubernetes_we.git'
            }
        }
        stage('maven build'){
            steps{
                echo 'maven clean build install'
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
                   echo 'docker image build'
                   sh 'docker build -t app:latest .'
                }
            }
            stage('psuh to ECR'){
                steps{
                    echo 'push docker image to aws ecr'
                    sh 'docker tag app:latest 899197664719.dkr.ecr.ap-south-1.amazonaws.com/app:latest'
                    sh '$(aws ecr get-login --no-include-email)'
                    sh 'docker push 899197664719.dkr.ecr.ap-south-1.amazonaws.com/app:latest'
                }
            }
            stage('ansible'){
                steps{
                    echo 'de'
                    sh 'ansible --version'
                    sh 'ansible-playbook ansibleplaybook.yaml --syntax-check'
                    sh 'ansible-playbook ansibleplaybook.yaml'
                }
            }
    }
     

}
