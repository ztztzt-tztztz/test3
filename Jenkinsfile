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
          mvn clean install
        }

      }
    }

  }
  options {
    timeout(time: 60, unit: 'MINUTES')
  }
}
