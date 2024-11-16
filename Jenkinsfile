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
    - name: maven
      image: maven:3.8.1-jdk-11
      command:
      - cat
      tty: true
"""
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
                container('maven') {
                    sh 'mvn --version'
                }
            }
        }
    }
}
