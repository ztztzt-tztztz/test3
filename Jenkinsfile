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
          sh 'git tag -n'
          sh "git checkout ${params.VERSION}"
          sh 'mvn clean install'
          echo 'git veriosn ${params.VERSION}'
          sh 'ls -l'
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
          sh 'ls -l'
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

    stage('deploy') {
      agent any
      steps {
        sh 'ssh zt@{IP} "kubectl set image deployment/my-app my-app=/ztztzt12345/test:${params.VERSION}"'
      }
    }

  }
  options {
    timeout(time: 60, unit: 'MINUTES')
    skipDefaultCheckout(true)
  }
  parameters {
    choice(name: 'VERSION', choices: ['v1.0', 'v2.0', 'v3.0'], description: 'Select the version to build')
  }
}