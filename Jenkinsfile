pipeline {
  agent any
  stages {
    stage('Build') {
      agent any
      steps {
        sh '${mvn_home}/bin/mvn clean install'
      }
    }

    stage('bulid image') {
      steps {
        dir(path: '/var/jenkins_home/workspace/test3_main@2') {
          sh 'bash -c "docker build -t test:v1 ."'
        }

        sh 'docker tag test:v1 ztztzt12345/test:v1'
        sh 'bash -c "docker push ztztzt12345/test:v1"'
      }
    }

    stage('deploy') {
      steps {
        sh 'bash -c "ssh zt@172.22.145.22 \'docker ps\'"'
      }
    }

  }
  environment {
    mvn_home = '/var/jenkins_home/tools/hudson.tasks.Maven_MavenInstallation/mvn_test'
  }
}