#   -------------------------------
#   Work Aliases
#   -------------------------------

alias flapjack='cd ~/SourceCode/Flapjack'
alias generate-tuist='source "$SCRIPTS_DIR/lib.sh" && close_xcode_if_running && tuist generate --path iOS'
alias kraken='cd ~/SourceCode/kraken-mobile-sdk'
alias run-shared-tests='./gradlew allTests'
alias run-ios-tests='./gradlew iosSimulatorArm64Test'
alias run-android-ui-tests='./gradlew :androidApp:connectedOctopusDebugAndroidTest'
alias run-spotless='./gradlew spotlessApply'
alias symmetry='cd ~/SourceCode/Flapjack/iOS/Packages/Symmetry'
alias local-properties='open local.properties'

#   -------------------------------
#   JDK (from the project README)
#   -------------------------------

export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
export JAVA_HOME=/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home
launchctl setenv JAVA_HOME $JAVA_HOME

#   -------------------------------
#   Mise (from the project README)
#   -------------------------------

export PATH=$HOME/.local/share/mise/shims:$PATH
# eval "$(~/.local/bin/mise activate zsh)"