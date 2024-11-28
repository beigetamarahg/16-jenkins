pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'crpp8mk9kaoas4dk6ouc/nginx-16:latest'
        REMOTE_USER = 'root'
        REMOTE_HOST = '185.125.230.12'
        REMOTE_PORT = 22
    }

    stages {
        stage('Git Clone') {
            steps {
                // Get some code from a GitHub repository
                git branch: 'main', url:  'https://github.com/beigetamarahg/16-jenkins.git'

            }
        }
        
        stage('Build and Push Docker Image') {
            steps { 
                  //script {
                  //  docker.withRegistry('https://cr.yandex', 'docker-yandex') {
                  //     docker.build("$DOCKER_IMAGE", "--progress=plain")
                  //      echo 'build succeful'
                  //      docker.image("$DOCKER_IMAGE").push()
                  //  }
                  //}
                sh 'docker image prune -af || true'
                sh 'docker build -t $DOCKER_IMAGE .'
                sh 'docker push $DOCKER_IMAGE'
             }
        }
         stage('Deploy via SSH') {
            steps {
                sshagent(['root']) {
                    sh """
                    ssh -p $REMOTE_PORT ${REMOTE_USER}@${REMOTE_HOST} 'docker pull $DOCKER_IMAGE && docker stop my-app || true && docker rm my-app || true && docker run -d --name my-app -p 80:80 $DOCKER_IMAGE'
                    """
                }
            }
         }
    }
}
