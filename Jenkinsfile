pipeline {
  agent any
  stages {
    stage('build ') {
      agent {
        docker {
          image 'maven:3-jdk-8'
          args '-v /path/to/your/volume:/app'
        }

      }
      steps {
        sh 'sh \'mvn clean install\''
      }
    }

  }
  tools {
    maven 'maven test'
  }
}