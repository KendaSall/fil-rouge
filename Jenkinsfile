pipeline{
    agent none
    stages{
        stage('RUN Docker Compose') {
            steps {
                sh 'sudo docker-compose up -d'
            }
        }
    }
}
