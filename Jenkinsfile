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
            podRetention never()
        }
    }
    stages {
        stage('Check if running in Kubernetes') {
            steps {
                script {
                    if (env.KUBERNETES_SERVICE_HOST) {
                        echo "Running in Kubernetes Pod!"
                    } else {
                        echo "Not running in Kubernetes!"
                    }
                }
            }
        }
        stage('Build') {
            steps {
                container('jnlp') {
                    sh 'mvn --version'
                }
            }
        }
    }
}
