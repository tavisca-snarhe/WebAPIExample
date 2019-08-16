pipeline {
    agent any

    stages {
	    stage('Restore') {
            steps {
                bat "dotnet restore"
            }
        }
        stage('Build') {
            steps {
                bat "dotnet build -p:Configuration=release -v:n"
            }
        }
        stage('Test') {
            steps {
                bat "dotnet test"
            }
        }
        stage('publish') {
            steps {
                bat "dotnet publish"
            }
        }
        stage('create_docker_image') {
            steps {
                bat "docker build -t webapi -f dockerfile ."
            }
        }
        stage('run_docker_image') {
            steps {
                bat "docker run --rm -p 8001:8001/tcp webapi:latest"
            }
        }
    }
}
