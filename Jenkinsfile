pipeline {
    agent {
        kubernetes {
            label 'k8s-agent' 
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
    stages {
        stage('Check if running in Kubernetes') {
            steps {
                script {
                    // 通过环境变量检查是否在 Pod 中运行
                    if (env.KUBERNETES_SERVICE_HOST) {
                        echo "Running in Kubernetes Pod!"
                    } else {
                        echo "Not running in Kubernetes!"
                    }
                }
            }
        }
    }
}
