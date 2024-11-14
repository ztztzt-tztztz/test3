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
        tool(name: 'docker test', type: 'docker')
      }
    }

  }
  tools {
    maven 'maven test'
  }
}