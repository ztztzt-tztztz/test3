pipeline {
  agent any
  stages {
    stage('Build') {
      agent any
      steps {
        ws(dir: '/var/jenkins_home/workspace/test2_main')
        sh 'echo ${mvn_home}'
        sh '${mvn_home}/bin/mvn  clean install'
      }
    }

    stage('bulid image') {
      steps {
        sh 'pwd'
        sh 'ls -l'
        sh 'sh \'docker build -t test:v1 .\''
        sh 'docker push ztztzt12345/test:v1'
      }
    }

    stage('test') {
      steps {
        sh 'echo "test"'
      }
    }

  }
  environment {
    mvn_home = '/var/jenkins_home/tools/hudson.tasks.Maven_MavenInstallation/mvn_test'
  }
}