pipeline {
  agent none
  
  stages {
    
    stage('Build') {
      agent {
        kubernetes {
          inheritFrom 'docker'
        }

      }
      steps {
        container(name: 'docker') {
          git(url: 'https://github.com/ztztzt-tztztz/test3.git', branch: 'main')
          sh -c '"echo "Building Docker image..."'
          sh -c "docker build -t my-app:v1 ."
        }

      }
    }

  }
  options {
    timeout(time: 60, unit: 'MINUTES')
  }
}
