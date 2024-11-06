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
      stage('up load to s3 bucket'){
       steps{   
       s3Upload consoleLogLevel: 'INFO', dontSetBuildResultOnFailure: false, dontWaitForConcurrentBuildCompletion: false, entries: [[bucket: 'vdbnetflixdemo', excludedFile: '', flatten: false, gzipFiles: false, keepForever: false, managedArtifacts: false, noUploadOnFailure: false, selectedRegion: 'ap-south-1', showDirectlyInBrowser: false, sourceFile: 'target/NETFLIX-1.2.2.war', storageClass: 'STANDARD', uploadFromSlave: false, useServerSideEncryption: false]], pluginFailureResultConstraint: 'FAILURE', profileName: 's3profile', userMetadata: []
            }
      }
      stage ( ' copy war file to ansible'){   
      steps{   
       sshagent(['ansiblessh']) {
        sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.6.48'
        sh  'scp /var/lib/jenkins/workspace/Jenkins_Ansible-intergration/target/NETFLIX-1.2.2.war ubuntu@172.31.6.48:/home/ubuntu'
          }
        }
      }    
      stage('Run Ansible Playbook'){
         steps {
           ansiblePlaybook credentialsId: 'devssh', disableHostKeyChecking: true, installation: 'ansible', inventory: 'etc/ansible/hosts', playbook: '/etc/ansible/playbook.yaml', vaultTmpPath: ''
              }
          }
        
               
     }
}
       
                       

