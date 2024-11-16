pipeline {
  agent none
  stages {
    stage('Mvn') {
      agent {
        kubernetes {
          inheritFrom 'maven'
        }

      }
      steps {
        container(name: 'maven') {
          sh 'mvn clean install'
        }

      }
    }

    stage('Docker') {
      agent {
        kubernetes {
          inheritFrom 'docker'
        }

      }
      steps {
        container(name: 'docker') {
sh 'docker ps'

sh 'docker build -t test:v11 .'
sh 'docker tag test:v11 ztztzt12345/test:v11'
withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
sh 'echo $DOCKERHUB_PASSWORD | docker login -u $DOCKERHUB_USERNAME --password-stdin' 
sh 'docker push ztztzt12345/test:v11' 
} 

        }

      }
    }

  }
  options {
    timeout(time: 60, unit: 'MINUTES')
  }
}
