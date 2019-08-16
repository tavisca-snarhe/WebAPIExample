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
        stage('create_docker_image') {
            steps {
                bat "docker build -t webapi -f dockerfile ."
            }
        }
        stage('run_docker_image') {
            steps {
                bat "docker run --rm -p 8004:8004/tcp webapi:latest"
            }
        }
    }
}
