pipeline {
  agent any
  stages {
    stage('test') {
      steps {
        echo 'k'
      }
    }

  }

 agent {
        kubernetes {
            cloud 'k8s' // 指定 Kubernetes cloud 配置的名字
            label 'jnlp1' // 使用你在配置中定义的模板名字
        }
    }
  stages {
        stage('Build') {
            steps {
                echo 'Building on Kubernetes agent!'
            }
        }
        stage('Test') {
            steps {
                echo 'Running tests on Kubernetes agent!'
            }
        }
    }
}
