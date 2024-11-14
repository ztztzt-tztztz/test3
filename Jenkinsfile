pipeline {
  agent any
  stages {
    stage('Build') {
      agent any
      steps {
        sh 'sh \'mvn clean install\''
      }
    }

  }
}