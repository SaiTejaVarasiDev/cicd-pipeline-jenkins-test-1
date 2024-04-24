pipeline {
    agent any
    environment{
        SF_INSTANCE_URL = credentials('SF_INSTANCE_URL')
        SF_USERNAME = credentials('SF_USERNAME')
        SF_CONSUMER_KEY = credentials('SF_CONSUMER_KEY')
        SF_SERVER_KEY = credentials('SF_SERVER_KEY')
        // toolbelt = tool 'salesforce_cli'
        // sf_path = "C:/Windows/System32/config/systemprofile/AppData/Local/Jenkins/.jenkins/tools/com.cloudbees.jenkins.plugins.customtools.CustomTool/salesforce/sf/bin"
        
        
        
    }
    stages {
        
        stage('Checking sf installation') {
            steps {
                bat 'sf --version'
            }
        }
        stage('Testing credentials') {
            steps {
                echo "$SF_INSTANCE_URL"
                echo "$SF_USERNAME"
                echo "$SF_CONSUMER_KEY"
                echo "$SF_SERVER_KEY"
            }
        }
        stage('Checking Server key access ') {
            steps {
                withCredentials([file(credentialsId: 'SF_SERVER_KEY', variable: 'secret_file_key')]){
                    echo "${secret_file_key}"
                }
            }
        }
        
    }
}
// node{
//     stage('Checkout source code'){
//         checkout scm
//     }
    
//     stage('running script'){
//         echo 'testing sf'
//         bat 'sf --version'
//     }
    
// }

