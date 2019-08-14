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
	stage('run') {
            steps {
                bat "dotnet WebAPIExample/bin/Release/netcoreapp2.2/WebAPIExample.dll"
            }
        }
    }
}
