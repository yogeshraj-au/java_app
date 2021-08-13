@Library('shared_library') _

pipeline{
    agent any

    options {
        timestamps()
        buildDiscarder(logRotator(numToKeepStr: '1'))
    }

    parameters {
        string(defaultValue: "yogeshraj292", description: 'repo name', name: 'name')
        string(defaultValue: "javaapp", description: 'repo name', name: 'appname')
        string(defaultValue: "1.0", description: 'which version?', name: 'tag')
    }

    stages{
        stage("checkout") {
            steps {
                git credentialsId: 'ef28acbe-2b70-4d27-bc4e-e705887d4a85', url: 'https://github.com/yogeshraj-au/java_app.git'
            }
        }
        stage("Maven Build") {
            agent {
                docker {
                    image 'maven:3.8.1-adoptopenjdk-11'
                }
            }
            steps {
                sh 'mvn clean package'
            }
        }
        stage("Build Docker image") {
            steps {
                sh 'pwd'
                sh "docker build -t ${params.name}/${params.appname}:${params.tag} ."
            }
        }
        stage("Push Docker image to registry") {
            steps {
                withCredentials([usernameColonPassword(credentialsId: '51a4ae27-73ea-475c-8fbf-9dc5550980bc', variable: '')]) {
                sh "docker login -u ${username} -p ${password}"
                 }
                sh "docker push ${params.name}/${params.appname}:${params.tag}"
            }
        }
    }
}
