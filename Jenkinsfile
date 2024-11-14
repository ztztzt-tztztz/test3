pipeline {
  agent any
  stages {
    stage('BUlid') {
      steps {
        tool(name: 'maven test', type: 'maven')
        sh 'mvn test'
        sh 'mvn clean install'
      }
    }

  }
  tools {
    maven 'maven test'
  }
}