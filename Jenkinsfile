pipeline {
    agent any
    parameters {
        booleanParam(defaultValue: false, description: 'if set, will not run the unit test stage', name: 'SkipTests')
        text(defaultValue: "Sreekanth", description: 'User Name', name:'Name')
    }
    stages {
        stage('Hello') {
            steps {
                echo "Hello $params.Name"
                echo "Start Upload to firebase ..."
                callBundlePrefixedScriptWithCorrectEnvironment($/exec sudo fastlane do_everything_dev/$)

            }
        }
    }
}

def callUnwrappedBundlePrefixedScriptWithCorrectEnvironment(String command) {
	def template = $/#! /bin/zsh
	export LANG=en_US.UTF-8
	bundle $command
	/$
	sh template
}


def callBundlePrefixedScriptWithCorrectEnvironment(String command) {
    echo "$command"
	sh "./run_bundle.sh $command"
    echo "$command"
}
