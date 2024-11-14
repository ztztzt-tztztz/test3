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
        tool(name: 'test', type: 'maven')
        sh 'sh \'mvn clean install\''
      }
    }

  }
}