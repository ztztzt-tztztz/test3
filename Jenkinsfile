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
                                                                      ssh zt@${IP} "ansible ${IP} -m command -a "docker build -t test:${params.TAG_VERSION} .""

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
            sh '''ssh zt@${IP} "echo \'if ! ss -tuln | grep \\":10080\\" > /dev/null; then echo \\"Port 10080 is not open, exiting.\\"; exit 1; fi; http_response_code=\\$(curl -s -o /dev/null -w \\"%{http_code}\\" http://172.22.145.22:10080); if [ \\"\\$http_response_code\\" -ne 200 ]; then echo \\"HTTP request failed with response code \\$http_response_code, exiting.\\"; exit 1; fi; echo \\"Port 10080 is open and HTTP response is 200.\\"\' > /tmp/check_port_and_http.sh"
ssh zt@${IP} "chmod +x /tmp/check_port_and_http.sh"
ssh zt@${IP} "/tmp/check_port_and_http.sh"'''
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

  }
  environment {
    MVN_HOME = '/var/jenkins_home/tools/maven'
    IP = '172.22.145.22'
  }
  parameters {
    choice(name: 'TAG_VERSION', choices: ['v1.0', 'v2.0', 'v3.0'], description: 'Select the version tag to deploy')
  }
}