pipeline {
  agent none
  parameters {
        choice(
            name: 'VERSION',
            choices: ['v1', 'v2', 'v3'],
            description: 'Select the version to build'
        )
    }
  stages {
    stage('Mvn') {
      agent {
        kubernetes {
          inheritFrom 'maven'
        }

      }
      steps {
        container(name: 'maven') {
          echo "Building version: ${params.VERSION}"
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

sh 'docker build -t test:${params.VERSION} .'
sh 'docker tag test:${params.VERSION} ztztzt12345/test:${params.VERSION}'
withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
sh 'echo $DOCKERHUB_PASSWORD | docker login -u $DOCKERHUB_USERNAME --password-stdin' 
sh 'docker push ztztzt12345/test:${params.VERSION}' 
} 

        }

      }
    }

  }
  options {
    timeout(time: 60, unit: 'MINUTES')
  }
}
