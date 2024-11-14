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
    mvn_home = '/var/jenkins_home/tools/hudson.tasks.Maven_MavenInstallation/mvn_test'
    PATH = 'PATH+EXTRA=$mvn_home/bin'
  }
}