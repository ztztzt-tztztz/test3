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

        }

      }
    }

  }
  options {
    timeout(time: 60, unit: 'MINUTES')
  }
}
