#!groovy

pipeline {
  agent none
  stages {
    stage('Maven Install') {
      agent {
        docker {
          image 'maven:3.5.0'
        }
      }
      steps {
        sh 'mvn clean install'
      }
    }
    
    stage('Docker Build') {
      agent any
      steps {
      
        sh 'docker build -t husseinfaresinfosysta/spring-petclinic:latest .'
      }
    }
    stage('Docker Push') {
      agent any
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
          sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
          sh ' docker push husseinfaresinfosysta/spring-petclinic:latest'
        }
      }
    }
   stage('Docker RUN APP') {
      agent any
      steps {
      
        sh 'docker run -d -p 9393:8080  husseinfaresinfosysta/spring-petclinic'
      }
    }
  }
}