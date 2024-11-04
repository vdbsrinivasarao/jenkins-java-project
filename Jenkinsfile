pipeline {
    agent any
       tools {
           maven 'mvn'
       }
    environment {
        // Define your credentials ID
        SSH_CREDENTIALS = 'ansiblessh'
        // Define the path to the WAR file and destination server details
        WAR_FILE = '/var/lib/jenkins/workspace/Jenkins_Ansible-intergration/target/NETFLIX-1.2.2.war'
        ANSIBLE_HOST = 'ansible'
        DESTINATION_PATH = '/etc/ansible'
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
      stage('up load to s3 bucket'){
       steps{   
       s3Upload consoleLogLevel: 'INFO', dontSetBuildResultOnFailure: false, dontWaitForConcurrentBuildCompletion: false, entries: [[bucket: 'vdbnetflixdemo', excludedFile: '', flatten: false, gzipFiles: false, keepForever: false, managedArtifacts: false, noUploadOnFailure: false, selectedRegion: 'ap-south-1', showDirectlyInBrowser: false, sourceFile: 'target/NETFLIX-1.2.2.war', storageClass: 'STANDARD', uploadFromSlave: false, useServerSideEncryption: false]], pluginFailureResultConstraint: 'FAILURE', profileName: 's3profile', userMetadata: []
            }
      }
      stages {
        stage('Deploy WAR') {
            steps {
                script {
                    // Use the sshagent to execute commands on the Ansible server
                    sshagent([ansiblessh]) {
                        // Copy the WAR file to the Ansible server
                        sh "scp {NETFLIX-1.2.2.war} ubuntu@{ANSIBLE_HOST}:{/etc/ansible}"
                        
                        // Execute Ansible playbook or command to deploy the WAR file
                        sh "ssh ubuntu@{ANSIBLE_HOST} 'ansible-playbook /etc/ansible/playbook.yaml'"
                    }
                }
            }  
     }
  }
 }      
                       
