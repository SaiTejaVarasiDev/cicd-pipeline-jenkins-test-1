node{
    stage('Checkout source code'){
        checkout scm
    }
    stage('running script'){
        rc = commad "sf --version"
        if (rc != 0) {
            error 'sf not installed'
        }
    }
    
}
def command(script) {
    if (isUnix()) {
        return sh(returnStatus: true, script: script);
    } else {
        return bat(returnStatus: true, script: script);
    }
}
