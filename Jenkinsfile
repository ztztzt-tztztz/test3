pipeline {
  agent any
  stages {
    stage('Build') {
      agent any
      steps {
        cleanWs(cleanWhenAborted: true, cleanWhenFailure: true, cleanWhenNotBuilt: true, cleanWhenSuccess: true, cleanWhenUnstable: true, cleanupMatrixParent: true, deleteDirs: true, disableDeferredWipeout: true)
        sh '''pwd
ls -l'''
        sh '${mvn_home}/bin/mvn clean install'
      }
    }

  }
  environment {
    mvn_home = '/var/jenkins_home/tools/hudson.tasks.Maven_MavenInstallation/mvn_test'
    IP = '172.22.145.22'
  }
}