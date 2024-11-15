pipeline {
  agent any
  stages {
    stage('git') {
      steps {
        ws(dir: 'test3_main') {
          sh '''pwd

'''
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
        sh '''git tag -n
git checkout v1.0'''
        sh '''
git status

pwd

ls -l
'''
        sh 'ls -l'
        sh '''${MVN_HOME}/bin/mvn  clean install

'''
        sh 'ls -l'
      }
    }

    stage('buld  image') {
      parallel {
        stage('buld  image') {
          steps {
            sh '''/usr/bin/docker  build -t test:v1 .

'''
            sh '/usr/bin/docker tag test:v1 ztztzt12345/test:v1'
            sh 'bash -c "docker push ztztzt12345/test:v1"'
          }
        }

        stage('build image2') {
          steps {
            sh 'echo "test is test"'
          }
        }

      }
    }

    stage('ssh  deploy') {
      parallel {
        stage('ssh  deploy') {
          steps {
            sh '''

bash -c "ssh zt@172.22.145.22 \'docker pull ztztzt12345/test:v1\'"


'''
            input(message: 'Do you want to deploy?', ok: 'Deploy')
            sh '''bash -c "ssh zt@172.22.145.22  \'docker rm -f test1\'"


bash -c "ssh zt@172.22.145.22  \'docker run -itd -p 10080:8080 --name test1 ztztzt12345/test:v1\'"
'''
            sh ''' 
bash -c "sleep 30"

bash -c "ssh zt@172.22.145.22 \'docker logs test1\'"'''
            sh '''ssh zt@172.22.145.22 "if ! ss -tuln | grep \':10080\' > /dev/null; then echo \'Port 10080 is not open, exiting.\'; exit 1; fi; http_response_code=\\$(curl -s -o /dev/null -w \'%{http_code}\' http://172.22.145.22:10080); if [ \\"\\$http_response_code\\" -ne 200 ]; then echo \'HTTP request failed with response code \\$http_response_code, exiting.\'; exit 1; fi; echo \'Port 10080 is open and HTTP response is 200.\'"
'''
          }
        }

        stage('deploy2') {
          steps {
            sh 'echo "test is is 2"'
          }
        }

      }
    }

  }
  environment {
    MVN_HOME = '/var/jenkins_home/tools/hudson.tasks.Maven_MavenInstallation/mvn_test'
    IP = '172.22.145.22'
  }
}
