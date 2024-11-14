pipeline {
  agent any
  stages {
    stage('Build') {
      agent {
        node {
          label 'master'
        }

      }
      steps {
        tool(name: 'mvn', type: 'Maven')
        sh 'sh \'mvn clean install\''
      }
    }

  }
}