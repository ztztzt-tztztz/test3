pipeline {
    agent any  // 在整个 pipeline 中，默认使用任何可用的 agent
    stages {
        stage('Build') {
            steps {
                echo 'Running on default agent'
            }
        }

        stage('Kubernetes Stage') {
            agent {
                kubernetes {
                    cloud 'k8s'  // 指定 Kubernetes cloud 配置的名字
                    label 'jnlp1'  // 使用你在配置中定义的模板名字
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
