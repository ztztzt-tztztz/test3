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
          echo "Building version: ${params.VERSION}"
          git(url: 'https://github.com/ztztzt-tztztz/test3.git', branch: 'main')
          sh '''git checkout ${params.VERSION}

git status'''
          sh 'mvn clean install'
          echo 'git veriosn ${params.VERSION}'
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
          sh "docker build -t test:${params.VERSION} ."
          sh "docker tag test:${params.VERSION} ztztzt12345/test:${params.VERSION}"
          withCredentials(bindings: [usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
            sh 'echo $DOCKERHUB_PASSWORD | docker login -u $DOCKERHUB_USERNAME --password-stdin'
            sh "docker push ztztzt12345/test:${params.VERSION}"
          }

        }

      }
    }

  }
  options {
    timeout(time: 60, unit: 'MINUTES')
  }
  parameters {
    choice(name: 'VERSION', choices: ['v1', 'v2', 'v3'], description: 'Select the version to build')
  }
}