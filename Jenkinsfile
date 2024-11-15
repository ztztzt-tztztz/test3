pipeline {
  agent any
  stages {
    stage('git') {
      steps {
        ws(dir: 'test3_main') {
          sh '''pwd

'''
        }

        git(url: 'https://github.com/ztztzt-tztztz/test3.git', branch: 'main')
        sh '''git tag -n
git status'''
      }
    }

    stage('deploy') {
      steps {
        sh '''pwd
ls -l'''
        sh '''git tag -n
git checkout v1.0'''
        sh '''
git status

pwd

ls -l
'''
        sh 'ls -l'
        sh '''${MVN_HOME}/bin/mvn  clean install

'''
        sh 'ls -l'
      }
    }

  }
  environment {
    MVN_HOME = '/var/jenkins_home/tools/hudson.tasks.Maven_MavenInstallation/mvn_test'
    IP = '172.22.145.22'
  }
}