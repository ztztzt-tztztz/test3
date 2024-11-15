pipeline {
  agent any
  stages {
    stage('Git') {
      agent any
      steps {
        git(url: 'https://github.com/ztztzt-tztztz/test3.git', branch: 'main')
        sh '''git status

git tag -n'''
      }
    }

  }
  environment {
    mvn_home = '/var/jenkins_home/tools/hudson.tasks.Maven_MavenInstallation/mvn_test'
    IP = '172.22.145.22'
  }
}