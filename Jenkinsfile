pipeline {
    agent any
    tools {
        maven 'maven test'  // 这里指定在全局工具配置中设置的 Maven 版本
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn clean install'  // 执行 Maven 命令
            }
        }
    }
}
