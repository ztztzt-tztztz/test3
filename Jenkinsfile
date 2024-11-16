pipeline {
  agent no
  
  stages {
    stage('Build') {
      agent {
        kubernetes {
          inheritFrom 'docker'
        }

      }
      steps {
        container(name: 'docker') {
          
          sh '''echo "Building Docker image..."
pwd
ls -l
echo $HOME
sh -c "docker build -t my-app:v1 ."'''
        }

      }
    }

  }
}
