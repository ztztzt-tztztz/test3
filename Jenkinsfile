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

    stage('bulid image') {
      steps {
        sh 'pwd'
        sh 'sh \'ls -l\''
        sh 'sh \'docker build -t test:v1 .\''
        sh 'docker push ztztzt12345/test:v1'
      }
    }

  }
  environment {
    mvn_home = '/var/jenkins_home/tools/hudson.tasks.Maven_MavenInstallation/mvn_test'
  }
}