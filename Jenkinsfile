pipeline {
  agent any
  stages {
    stage('test') {
      steps {
        sh 'echo "test is test"'
      }
    }

  }
  environment {
    MVN_HOME = '/var/jenkins_home/tools/maven'
    IP = '172.22.145.22'
  }
  
}
