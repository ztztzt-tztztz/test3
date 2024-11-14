pipeline {
  agent any
  stages {
    stage('Build') {
      agent any
      steps {
        tool(name: 'mvn test', type: 'Maven')
        sh 'sh \'mvn clean install\''
      }
    }

  }
}