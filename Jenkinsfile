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

    stage('Mvn') {
      steps {
        container(name: 'maven') {
          sh 'mvn clean install'
        }

      }
    }

    stage('Build') {
      agent {
        kubernetes {
          inheritFrom 'docker'
        }

      }
      steps {
        container(name: 'docker') {
          sh '''echo "Building Docker image..."
sh -c "docker build -t my-app:v1 ."'''
        }

      }
    }

  }
  options {
    timeout(time: 60, unit: 'MINUTES')
  }
}