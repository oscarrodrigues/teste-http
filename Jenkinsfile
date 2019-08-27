pipeline {
  environment {
    registry = "orodrigues/teste-http"
    registryCredential = 'dockerhub'
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/oscarrodrigues/teste-http.git'
      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker image rm -f $registry:$BUILD_NUMBER"
      }
    }
    stage('approval (production)') {
      steps{
        input message: 'Aprovar para ambiente de Produção?',
        id: 'approval'
      }
    }
    stage('Deploy no ambiente de Produção') {
      steps{
        sh "echo 'Deploy ambiente de Produção'"
      }
    }
  }
}
