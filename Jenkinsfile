pipeline {
    agent any
    stages {
	    stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: "*/${GIT_BRANCH}" ]],
                doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], 
                userRemoteConfigs: [[url: "${GIT_URL}" ]]])
            }
        }
        stage('Restore') {
            steps {
                bat "dotnet restore"
            }
        }
        stage('Build') {
            steps {
                bat "dotnet build -p:Configuration=Release -v:n"
            }
        }
        stage('Test') {
            steps {
                bat "dotnet test"
            }
        }
        stage('publish') {
            steps {
                bat "dotnet publish -c Release -o Publish"
            }
        }
        stage('deploy') {
            steps {
                bat "docker build -t webapi -f dockerfile ."
                bat "docker tag webapi saurabhnarhe123/webapi"
                bat "docker push saurabhnarhe123/webapi"
                bat "docker run --rm -p 8004:8004/tcp webapi:latest"
            }
        }
    }
}
