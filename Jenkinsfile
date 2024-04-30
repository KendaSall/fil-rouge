pipeline{
    agent{
        label "docker-agent"
    }
    stages{
        stage('RUN Docker Compose') {
            steps {
                sh 'sudo docker-compose up -d'
            }
        }
    }
}
