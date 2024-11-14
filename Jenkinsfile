pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'Building...'
        tool(name: 'Maven 3.x', type: 'Maven')
      }
    }

  }
}