pipeline {
  agent any
  stages {
    stage('Build') {
      agent any
      steps {
        tool(name: 'mvn test', type: 'maven')
        sh 'mvn clean install'
      }
    }

  }
}