pipeline {
    agent any

    stages {
	stage('Restore') {
            steps {
                sh "dotnet restore"
            }
        }
        stage('Build') {
            steps {
                sh "dotnet build -p:Configuration=release -v:n"
            }
        }
        stage('Test') {
            steps {
                sh "dotnet test"
            }
        }
	stage('publish') {
            steps {
                sh "dotnet publish"
		sh "zip -r artifact.zip WebAPIExample/bin/Release/netcoreapp2.2/"
            }
        }
	stage('run') {
            steps {
                sh "dotnet WebAPIExample/bin/Release/netcoreapp2.2/WebAPIExample.dll"
            }
        }
    }
}
