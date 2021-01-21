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
         stage('Maven clean and build'){
             steps{
                 sh 'mvn clean'
                 sh 'mvn install'
             }
         }
         stage('Docker Build Image'){
             steps{
                 sh 'docker --version'
                 sh 'docker build -t myimg:1 .'
             }
         }
         stage('Push Docker Image'){
             steps{
                 sh ' $(aws ecr get-login --no-include-email)'
                 sh 'docker tag myimg:1 559584465773.dkr.ecr.ap-south-1.amazonaws.com/myapp:1'
                 sh 'docker push 559584465773.dkr.ecr.ap-south-1.amazonaws.com/myapp:1'
             }
         }
         stage ('deploying to EKS') {
           steps { 
                echo "deploying imges to EKS"
                sh 'kubectl apply -f deployment.yaml'
                sh 'kubectl apply -f service.yaml'
           }
         }  
     }

}
