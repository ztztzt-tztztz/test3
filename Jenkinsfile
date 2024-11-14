pipeline {
  agent {
    docker {
      image 'maven:3.8.1-jdk-11'
    }

  }
  stages {
    stage('Build') {
      agent any
      steps {
        sh 'mvn clean install'
      }
    }

  }
}