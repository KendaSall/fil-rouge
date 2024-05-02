pipeline {
    agent any
    environment {
        DOCKER_COMPOSE_VERSION = '1.29.2'
    }
    stages {
        stage('Build') {
            steps {
                script {
                    // Téléchargement de Docker Compose
                    bat "curl -L \"https://github.com/docker/compose/releases/download/\${DOCKER_COMPOSE_VERSION}/docker-compose-\$(uname -s)-\$(uname -m)\" -o /usr/local/bin/docker-compose"
                    bat "chmod +x /usr/local/bin/docker-compose"
                    // Lancement de Docker Compose
                    bat 'docker-compose up -d --build'
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    // Mettez ici vos commandes pour exécuter des tests
                    echo "Running tests"
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    // Mettez ici vos commandes pour déployer l'application
                    echo "Deploying to production"
                }
            }
        }
    }
    post {
        always {
            // Nettoyer les ressources Docker
            bat 'docker-compose down'
        }
    }
}
