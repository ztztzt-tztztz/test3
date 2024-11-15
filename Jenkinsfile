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
      steps {
        sh '''/usr/bin/docker  build -t test:v1 .

'''
        sh '/usr/bin/docker tag test:v1 ztztzt12345/test:v1'
        sh 'bash -c "docker push ztztzt12345/test:v1"'
      }
    }

    stage('ssh  deploy') {
      steps {
        sh '''

bash -c "ssh zt@172.22.145.22 \'docker pull ztztzt12345/test:v1\'"


'''
        sh '''bash -c "ssh zt@172.22.145.22  \'docker rm -f test1\'"


bash -c "ssh zt@172.22.145.22  \'docker run -itd -p 10080:8080 --name test1 ztztzt12345/test:v1\'"
'''
        sh ''' 
bash -c "sleep 30"

bash -c "ssh zt@172.22.145.22 \'docker logs test1\'"'''
      }
    }

  }
  environment {
    MVN_HOME = '/var/jenkins_home/tools/hudson.tasks.Maven_MavenInstallation/mvn_test'
    IP = '172.22.145.22'
  }
}