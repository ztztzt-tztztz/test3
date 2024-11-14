pipeline {
  agent any
  stages {
    stage('BUlid') {
      steps {
        tool(name: 'maven test', type: 'maven')
        sh 'mvn test'
      }
    }

  }
  tools {
    maven 'maven test'
  }
}