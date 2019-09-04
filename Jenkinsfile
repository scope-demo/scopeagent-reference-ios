pipeline {
    agent {
      label 'mac'
    }

    stages {
        stage('Build') {
            steps {
                sh 'xcrun xcodebuild -workspace ScopeAgent-Reference.xcworkspace -scheme ScopeAgent-Reference -sdk iphonesimulator -destination \'platform=iOS Simulator,name=iPhone X\' SYMROOT=$(PWD)/build test'
            }
        }
    }
}
