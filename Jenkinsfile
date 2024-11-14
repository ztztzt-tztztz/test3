pipeline {
  agent any
  stages {
    stage('Build') {
      agent any
      steps {
        sh 'sh \'mvn clean install\''
      }
    }

  }
  environment {
    PATH = 'PATH+EXTRA=/var/jenkins_home/tools/hudson.tasks.Maven_MavenInstallation/mvn_test/bin'
  }
}