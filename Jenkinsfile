pipeline {
    agent none  // Définit l'agent sur "none" pour indiquer que le pipeline s'exécute sur le nœud maître

    stages {
        stage('RUN Docker Compose') {
            steps {
                node { // Ajout du bloc node pour fournir un contexte de nœud
                    script {
                        try {
                            sh 'docker-compose up -d'
                        } catch (err) {
                            echo "Error: ${err}"
                            currentBuild.result = 'FAILURE'
                            error "Failed to start Docker Compose"
                        }
                    }
                }
            }
        }
    }
    post {
        always {
            script {
                sh 'docker-compose down'
            }
        }
    }
}
