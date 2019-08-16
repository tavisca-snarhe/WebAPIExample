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
        stage('deploy') {
            steps {
                bat "docker build -t webapi -f dockerfile ."
                bat "docker run --rm -p 8004:8004/tcp webapi:latest"
            }
        }
    }
}
