#   -------------------------------
#   Work Aliases
#   -------------------------------

alias fj='cd ~/Development/Flapjack'
alias fj2='cd ~/Development/Flapjack2'
alias generate-tuist='source "$SCRIPTS_DIR/lib.sh" && close_xcode_if_running && tuist generate --path iOS'
alias push-no-checks='git push --no-verify'
alias run-shared-tests='./gradlew allTests'
alias run-ios-tests='./gradlew iosSimulatorArm64Test'
alias run-android-ui-tests='./gradlew :androidApp:connectedOctopusDebugAndroidTest'
alias run-spotless='./gradlew spotlessApply'
alias symmetry='cd ~/Development/Flapjack/iOS/Packages/Symmetry'
alias local-properties='open local.properties'

#   -------------------------------
#   JDK (from the project README)
#   -------------------------------

export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
export JAVA_HOME=/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home

#   -------------------------------
#   Mise (from the project README)
#   -------------------------------

export PATH=$HOME/.local/share/mise/shims:$PATH
eval "$(~/.local/bin/mise activate zsh)"