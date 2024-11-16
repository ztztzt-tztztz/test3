pipeline {
  agent any
  stages {
    stage('test') {
      steps {
        sh 'echo "test is test'
      }
    }

  }
  environment {
    MVN_HOME = '/var/jenkins_home/tools/maven'
    IP = '172.22.145.22'
  }
  parameters {
    choice(name: 'TAG_VERSION', choices: ['v1.0', 'v2.0', 'v3.0'], description: 'Select the version tag to deploy')
  }
}