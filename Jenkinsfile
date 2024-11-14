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

    stage('build image') {
      agent any
      steps {
        sh 'docker ps'
      }
    }

  }
  tools {
    maven 'maven test'
  }
}