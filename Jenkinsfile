pipeline {
    agent any
       tools {
           maven 'mvn'
       }
   
    stages {
        stage('Git clone') {
            steps {
                // Get some code from a GitHub repository
               git 'https://github.com/vdbsrinivasarao/jenkins-java-project.git'
                 }
          }
        stage('build') {
          steps{
            sh 'mvn clean package'
         }
       }
      
}
}
