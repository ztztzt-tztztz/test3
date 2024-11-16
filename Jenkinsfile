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
          sh '''docker ps

docker build -t test:v11 .


docker tag test:v11  ztztzt12345/test:v11

sh \'echo $DOCKERHUB_PASSWORD | docker login -u ztztzt12345 --password-stdin\' 

sh \'docker push my-app:v1\'

docker push ztztzt12345/test:v11'''
        }

      }
    }

  }
  options {
    timeout(time: 60, unit: 'MINUTES')
  }
}