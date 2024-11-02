pipeline {
    agent any
          tools {
        // Install the Maven version configured as "Maven3" and add it to the path.
           maven "Maven3"
          }
    
    stages {
        stage('Git clone') {
            steps {
                // Get some code from a GitHub repository
               git 'https://github.com/vdbsrinivasarao/maven_project.git'
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
