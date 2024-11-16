pipeline {
    agent {
        kubernetes {
            
            podRetention never()
        }
    }
    stages {
        stage('Check if running in Kubernetes') {
            steps {
                script {
                    if (env.KUBERNETES_SERVICE_HOST) {
                        echo "Running in Kubernetes Pod!"
                    } else {
                        echo "Not running in Kubernetes!"
                    }
                }
            }
        }
        stage('Build') {
            steps {
                container('maven') {
                    sh 'mvn --version'
                }
            }
        }
    }
}
