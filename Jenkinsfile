pipeline {
    agent any
    environment{
        SF_INSTANCE_URL = credentials('SF_INSTANCE_URL')
        SF_USERNAME = credentials('SF_USERNAME')
        SF_CONSUMER_KEY = credentials('SF_CONSUMER_KEY')
    }
    stages {
        
        stage('developer branch') {
            when {
                branch 'developer'
            }
            steps {
                echo "developer branch"
            }
        }
        stage('developer branch with pull request') {
            when {
                changeRequest target: 'developer'
            }
            steps {
                echo "developer branch with change request"
            }
        }
        stage('production branch') {
            when {
                branch 'production'
            }
            steps {
                echo "production branch"
            }
        }
        
        stage('production branch with pull request') {
            when {
                changeRequest target: 'production'
            }
            steps {
                echo "production branch with change request"
            }
        }
        // stage('Checking sf installation') {
        //     steps {
        //         bat 'sf --version'
        //     }
        // }
        // stage('Testing credentials') {
        //     steps {
        
        //         echo "$SF_INSTANCE_URL"
        //         echo "$SF_USERNAME"
        //         echo "$SF_CONSUMER_KEY"
        
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
        stage('Validate soure code on org') {
            steps {
                withEnv(["HOME=${env.WORKSPACE}"]) {
                    bat "sf project deploy validate -o ${SF_USERNAME} --source-dir force-app"
                }
            }
        }
        stage('retrieve code') {
            steps {
                withEnv(["HOME=${env.WORKSPACE}"]) {
                    bat "sf project retrieve start --metadata ApexClass --target-org my-hub-org"
                }
            }
        }

        // stage('deploy soure code on org') {
        //     steps {
        //         withEnv(["HOME=${env.WORKSPACE}"]) {
        //             bat "sf project deploy quick --use-most-recent --target-org my-hub-org"
        //         }
        //     }
        // }
        
    }
}

