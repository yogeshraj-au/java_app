pipeline{
    agent any

    stages{
        stage("checkout"){
            steps{
                git credentialsId: 'ef28acbe-2b70-4d27-bc4e-e705887d4a85', url: 'https://github.com/yogeshraj-au/java_app.git'
            }
        }
        stage("Maven Build"){
            agent {
                docker {
                    image 'maven:3.8.1-adoptopenjdk-11'
                }
            }
            steps{
                sh 'mvn clean package'
            }
        }
        stage("Build Docker image"){
            steps{
               echo "build is done"
            }
        }
    }
}
