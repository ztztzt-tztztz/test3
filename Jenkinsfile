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
          git(url: 'https://github.com/ztztzt-tztztz/test3.git', branch: 'main')
          sh '''echo "Building Docker image..."
pwd
ls -l
echo $HOME
sh -c "docker build -t my-app:v1 ."'''
        }

      }
    }

  }
  options {
    timeout(time: 60, unit: 'MINUTES')
  }
}