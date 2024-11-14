pipeline {
  agent any
  stages {
    stage('Build') {
      agent any
      steps {
        sh 'echo ${env.mvn_home}'
        sh '''
export PATH=${env.PATH}:${env.mvn_home}/bin
echo $PATH
sh \'mvn clean install\''''
      }
    }

  }
  environment {
    mvn_home = '/var/jenkins_home/tools/hudson.tasks.Maven_MavenInstallation/mvn_test'
  }
}