pipeline {
  agent any
  stages {
    stage('git') {
      steps {
        ws(dir: 'test3_main') {
          sh 'pwd'
        }

        git(url: 'https://github.com/ztztzt-tztztz/test3.git', branch: 'main')
        sh '''git tag -n
                git status'''
      }
    }

    stage('mvn') {
      steps {
        sh '''pwd
                ls -l'''
        sh """
                git tag -n
                git checkout ${params.TAG_VERSION}
                """
        sh '''git status
                pwd
                ls -l
                '''
        sh '''
                ${MVN_HOME}/bin/mvn clean install
                '''
        sh 'ls -l'
      }
    }

    stage('build image') {
      parallel {
        stage('build image') {
          steps {
            sh """
                docker build -t test:${params.TAG_VERSION} .
                """
            sh """
                /usr/bin/docker tag test:${params.TAG_VERSION} ztztzt12345/test:${params.TAG_VERSION}
                """
            sh """
                bash -c "docker push ztztzt12345/test:${params.TAG_VERSION}"
                """
          }
        }

        stage('build image2') {
          steps {
            sh 'echo "test is test"'
          }
        }
      }
    }

    stage('ssh deploy') {
      parallel {
        stage('ssh deploy') {
          steps {
            sh """
                bash -c "ssh zt@${IP} 'docker pull ztztzt12345/test:${params.TAG_VERSION}'"
                """
            input(message: 'Do you want to deploy?', ok: 'Deploy')
            sh """
                bash -c "ssh zt@${IP} 'docker rm -f test1'"
                bash -c "ssh zt@${IP} 'docker run -itd -p 10080:8080 --name test1 ztztzt12345/test:${params.TAG_VERSION}'"
                """
            sh """
                bash -c "sleep 3"
                bash -c "ssh zt@${IP} 'docker logs test1'"
                """
            sh '''ssh zt@${IP} \'ansible localhost -m wait_for -a "host=172.22.145.22 port=10080 state=started timeout=30"\'
                '''
            sh '''ssh zt@${IP} "ansible ${IP} -m uri -a \'url=http://172.22.145.22:10080 return_content=no status_code=200\' --become --become-user root"
                '''
          }
        }

        stage('deploy2') {
          steps {
            sh 'echo "test is test 2"'
            sh 'bash -c "ssh zt@${IP} \'ansible ${IP} -m setup -u zt\'"'
          }
        }
      }
    }

    stage('test') {
      steps {
        echo 'test'
      }
    }

    stage('k8s deploy') {
      agent {
        kubernetes {
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
  }
  environment {
    MVN_HOME = '/var/jenkins_home/tools/maven'
    IP = '172.22.145.22'
  }
  parameters {
    choice(name: 'TAG_VERSION', choices: ['v1.0', 'v2.0', 'v3.0'], description: 'Select the version tag to deploy')
  }
}
