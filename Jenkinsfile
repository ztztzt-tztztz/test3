pipeline {
  agent any
  stages {
    stage('Git') {
      agent any
      steps {
        cleanWs(cleanWhenAborted: true, cleanWhenFailure: true, cleanWhenNotBuilt: true, cleanWhenSuccess: true, cleanWhenUnstable: true, cleanupMatrixParent: true, deleteDirs: true, disableDeferredWipeout: true)
        ws(dir: '/var/jenkins_home/workspace/test3_main') {
          git(url: 'https://github.com/ztztzt-tztztz/test3.git', branch: 'main')
          sh '''pwd

git status 


git tag -n'''
        }

      }
    }

    stage('Build') {
      steps {
        sh '''pwd

ls -l


git tag -n'''
      }
    }

  }
  environment {
    mvn_home = '/var/jenkins_home/tools/hudson.tasks.Maven_MavenInstallation/mvn_test'
    IP = '172.22.145.22'
  }
}