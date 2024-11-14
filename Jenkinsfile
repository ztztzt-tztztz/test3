pipeline {
  agent any
  stages {
    stage('BUlid') {
      steps {
        tool(name: 'maven test', type: 'maven')
        sh 'mvn test'
        sh 'mvn clean install'
      }
    }

    stage('build image') {
      agent {
        docker {
          image 'docker:latest'
          args 'args \'--privileged -v /var/run/docker.sock:/var/run/docker.sock\''
        }

      }
      steps {
        sh 'sh \'docker build -t my-app-image:latest .\''
      }
    }

  }
  tools {
    maven 'maven test'
  }
}