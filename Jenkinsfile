pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'Running on default agent'
      }
    }

    stage('Kubernetes Stage') {
      agent {
        kubernetes {
          cloud 'k8s'
          label 'jnlp1'
        }

      }
      steps {
        echo 'Building on Kubernetes agent!'
      }
    }

    stage('Test') {
      steps {
        echo 'Running tests on default agent'
      }
    }

  }
}