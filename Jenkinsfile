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
    MAVEN_HOME = '/var/jenkins_home/tools/hudson.tasks.Maven_MavenInstallation/mvn_test'
    PATH = '${env.PATH}:${MAVEN_HOME}/bin'
  }
}