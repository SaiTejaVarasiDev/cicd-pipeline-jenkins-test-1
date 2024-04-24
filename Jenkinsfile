pipeline {
    agent any
    environment{
        SF_INSTANCE_URL = credentials('SF_INSTANCE_URL')
        SF_USERNAME = credentials('SF_USERNAME')
        SF_CONSUMER_KEY = credentials('SF_CONSUMER_KEY')
        // SF_SERVER_KEY = credentials('SF_SERVER_KEY')
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
        // stage('Checking Server key access ') {
        //     steps {
        //         withCredentials([file(credentialsId: 'SF_SERVER_KEY', variable: 'secret_file_key')]){
        //             echo "${secret_file_key}"
        //         }
        //     }
        // }
        // stage('copying server key file'){
        //     steps {
        //         withCredentials([file(credentialsId: 'SF_SERVER_KEY', variable: 'secret_file_key')]){
        //             bat "cd"
        //             bat "copy ${secret_file_key}"
        //             bat "dir"
        //         }
                
        //     }
        // }
        stage('Authorize to org') {
            steps {
                withEnv(["HOME=${env.WORKSPACE}"]) {
                    withCredentials([file(credentialsId: 'SF_SERVER_KEY', variable: 'secret_file_key')]){
                        bat "sf org login jwt --client-id ${SF_CONSUMER_KEY} --jwt-key-file ${secret_file_key} --username ${SF_USERNAME} --alias my-hub-org"
                    }
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

