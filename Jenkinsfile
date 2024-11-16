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
    - name: docker
      image: docker:20.10.7
      command:
      - cat
      tty: true
      volumeMounts:
      - name: docker-sock
        mountPath: /var/run/docker.sock
  volumes:
  - name: docker-sock
    hostPath:
      path: /var/run/docker.sock
"""
        }
    }
    stages {
        stage('Build with Maven') {
            steps {
                container('maven') {
                    sh 'mvn clean install'
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                container('docker') {
                    sh 'docker build -t test:v11 .'
                }
            }
        }
        stage('Tag Docker Image') {
            steps {
                container('docker') {
                    sh 'docker tag test:v11 ztztzt12345/test:v11'
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                container('docker') {
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
                        sh 'echo $DOCKERHUB_PASSWORD | docker login -u $DOCKERHUB_USERNAME --password-stdin'
                        sh 'docker push ztztzt12345/test:v11'
                    }
                }
            }
        }
    }
}
