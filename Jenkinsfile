pipeline {
  agent any
  stages {
    stage('Build') {
      agent any
      steps {
        cleanWs(cleanWhenAborted: true, cleanWhenFailure: true, cleanWhenNotBuilt: true)
        sh 'echo ${mvn_home}'
        sh '${mvn_home}/bin/mvn clean install'
      }
    }

    stage('bulid image') {
      steps {
        sh 'pwd'
        sh 'ls -l'
        sh 'pwd '
        sh 'bash -c "docker build -t test:v1 ."'
        sh 'pwd'
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