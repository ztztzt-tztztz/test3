pipeline {
  agent any
  stages {
    stage('bulding') {
      agent {
        docker {
          image 'maven:3-jdk-8'
        }

      }
      steps {
        sh 'sh \'mvn clean install\''
      }
    }

  }
}