pipeline {
    agent any

	parameters{
		string(defaultValue:"webapiimage", description: 'Docker Image', name: 'imageName')
		string(defaultValue:"saurabhnarhe123/webapi", description: 'Repository Name', name: 'repositoryName')
		string(defaultValue:"webapi_tag", description: 'Docker image Tag', name: 'tag')
		string(defaultValue:"8004", description: 'Docker port', name: 'dockerPort')
		string(defaultValue:"8004", description: 'Local port', name: 'localPort')
		string(defaultValue:"sonarqube_webapi", description: 'Sonarqube Project Key', name: 'projectKey')
		string(defaultValue:"http://localhost:9000", description: 'Sonar Host Url', name: 'sonarHostUrl')
	}
    stages {
        stage('Build') {
        	steps{
        		bat 'dotnet build -p:Configuration=release -v:n'
        	}
        }
        stage('Test') {
        	steps{
        		bat 'dotnet test %testFile%'
                }
        }
	stage('Code Analysis'){
		steps{
			echo 'SonarQube Code Analysis'
			script{
				withSonarQubeEnv ('SonarQubeServer'){
					withCredentials([usernamePassword(credentialsId: 'c53259fe-e56f-4aa1-9475-5c3787e798d3', passwordVariable: 'password', usernameVariable: 'username')]){
						bat 'dotnet %SonarScanner% begin /key:%projectKey% /d:sonar.login=%username% /d:sonar.password=%password%'
						bat 'dotnet build'
						bat 'dotnet %SonarScanner% end /d:sonar.login=%username% /d:sonar.password=%password%'
					}
				}
			}
		}
	}
        stage('Publish') {
        	steps{
        		bat 'dotnet publish -c Release -o Publish'
        	}
        }
	stage('Docker Build'){
		steps{
			bat 'docker build --tag=%imageName% --file=Dockerfile .'
		}
	}
	stage('Docker Login'){
		steps{
			withCredentials([usernamePassword(credentialsId: 'ffea00e9-a59b-4be5-87a6-13f8b36d3e11', passwordVariable: 'password', usernameVariable: 'username')]){
				bat 'docker login --username=%username% --password=%password%'
			}
		}
	}
	stage('Docker Push-Pull'){
		steps{
			bat 'docker tag %imageName% %repositoryName%:%tag%'
			bat 'docker push %repositoryName%:%tag%'
			bat 'docker pull %repositoryName%:%tag%'
		}
	}
	stage('Deploy Project'){
		steps{
			bat 'docker run -d -p %dockerPort%:%localPort% --rm %imageName%'
		}
	}
    }
    post{
	    always {
		    deleteDir()
	    }
    }
}
