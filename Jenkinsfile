pipeline{
    agent any
    stages{
        stage("clone"){
            steps{
                echo "cloning from github"
                git url:"https://github.com/varikuppalahemanth/my-react-app.git", branch:"main"
            }
            
        }
        stage("build"){
            steps{
                echo "building the image"
                sh "docker buildx -t my-react-app ."
            }
            
        }
        stage("push"){
            steps{
                echo "pushing the image to docker hub"
                withCredentials([usernamePassword(credentialsId:"DockerHub",usernameVariable:"DockerUsername",passwordVariable:"DockerPassword")]){
                    sh "docker tag my-react-app ${env.DockerUsername}/my-react-app:latest"
                    sh "docker login -u ${env.DockerUsername} -p ${env.DockerPassword}"
                    sh "docker push ${env.DockerUsername}/my-react-app:latest"
                }
                
            }
            
        }
        stage("deploy"){
            steps{
                echo "running the image"
                sh "docker-compose down && docker-compose up -d"
                sh 'docker ps'
            }
            
        }
    }
}
