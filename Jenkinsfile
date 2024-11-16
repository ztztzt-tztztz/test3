pipeline {
    agent any  // 默认使用任何可用的 agent
    stages {
        stage('Build') {
            steps {
                echo 'Running on default agent'
            }
        }

        stage('K8s Deploy') {
            agent {
                kubernetes {
                    label 'k8s-agent'  // 定义你在 Kubernetes 配置中使用的 label
                    yaml """
apiVersion: v1
kind: Pod
spec:
  containers:
    - name: jnlp
      image: jenkins/inbound-agent
      args: ['\$(JENKINS_SECRET)', '\$(JENKINS_NAME)']
"""
                }
            }
            steps {
                echo 'Deploying to Kubernetes...'
                // 在这里添加你的 Kubernetes 部署步骤
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests on default agent'
            }
        }
    }
}
