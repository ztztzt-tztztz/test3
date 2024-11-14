pipeline {
    agent {
        docker {
            image 'maven:3.8.1-jdk-11' // 使用 Maven 官方镜像
            
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn clean install' // 在 Docker 容器中运行 Maven 命令
            }
        }
    }
}
