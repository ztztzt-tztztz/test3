pipeline {
    agent {
        kubernetes {
            podRetention never()
        }
    }
    options {
        timeout(time: 60, unit: 'MINUTES') // 设置超时时间为60分钟
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
                    sh 'mvn clean install'
                }
            }
        }
    }
}
