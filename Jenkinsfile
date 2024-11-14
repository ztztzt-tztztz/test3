pipeline {
  agent any
  stages {
    stage('Build') {
      agent any
      steps {
        tool(name: 'mvn', type: 'Maven')
        sh 'sh \'mvn clean install\''
      }
    }

  }
}