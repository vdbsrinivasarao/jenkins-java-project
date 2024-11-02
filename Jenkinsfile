pipeline {
    agent any
        
    
    stages {
        stage('Git clone') {
            steps {
                // Get some code from a GitHub repository
               git 'https://github.com/vdbsrinivasarao/jenkins-java-project.git'
                 }
          }
        stage('build') {
          steps{
            sh 'mvn compile'
         }
       }
        stage('test') {
         steps{
           sh 'mvn test'
        }
      }
        stage('artifact') {
          steps{
          sh 'mvn package'
          }
      }

}
}
