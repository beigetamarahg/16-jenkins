pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'crpp8mk9kaoas4dk6ouc/nginx-16:latest'
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
    
                  echo 'build succeful'
                  
                  script {
                    docker.build("$DOCKER_IMAGE", "--progress=plain")

                    docker.withRegistry('cr.yandex', 'docker-yandex') {
                        docker.image("$DOCKER_IMAGE").push()
                    }
                  }
             }
        }
    }
}
