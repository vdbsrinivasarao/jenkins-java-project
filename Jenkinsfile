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
      stage{ 'up load to s3 bucket'){
          
      s3Upload consoleLogLevel: 'INFO', dontSetBuildResultOnFailure: false, dontWaitForConcurrentBuildCompletion: false, entries: [[bucket: 'vdbnetflixdemo', excludedFile: '', flatten: false, gzipFiles: false, keepForever: false, managedArtifacts: false, noUploadOnFailure: false, selectedRegion: 'ap-south-1', showDirectlyInBrowser: false, sourceFile: '/var/lib/jenkins/workspace/Jenkins_Ansible-intergration/target/NETFLIX-1.2.2.war', storageClass: 'STANDARD', uploadFromSlave: false, useServerSideEncryption: false]], pluginFailureResultConstraint: 'FAILURE', profileName: 's3profile', userMetadata: []
      }
      }
                       
}
