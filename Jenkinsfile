pipeline {
  agent any
  stages {
    stage('Build') {
      agent {
        node {
          label 'master'
        }

      }
      steps {
        tool(name: 'test', type: 'maven')
        sh 'sh \'mvn clean install\''
      }
    }

  }
  environment {
    maven_home = '/var/jenkins_home/tools/hudson.tasks.Maven_MavenInstallation/mvn_test'
    PATH = '$maven_home/bin:$PATH'
  }
}