pipeline {
  agent any
  stages {
    stage('git') {
      steps {
        git(url: 'https://github.com/ztztzt-tztztz/test3.git', branch: 'main')
      }
    }

    stage('test') {
      steps {
        echo 'test'
      }
    }

  }
}