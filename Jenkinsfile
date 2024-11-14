pipeline {
  agent any
  stages {
    stage('Build') {
      agent any
      steps {
        sh 'echo ${mvn_home}'
        sh '''
export PATH=${PATH}:${mvn_home}/bin
echo $PATH
mvn clean install'''
      }
    }

  }
  environment {
    mvn_home = '/var/jenkins_home/tools/hudson.tasks.Maven_MavenInstallation/mvn_test'
  }
}