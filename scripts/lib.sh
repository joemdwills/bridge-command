function close_xcode_if_running {
    if pgrep -x "Xcode" > /dev/null; then
        echo "Xcode is running. Closing it now."
        killall Xcode
    else
        echo "No need to close Xcode - it is not running."
    fi
}

function print_header {
    CYAN='\033[1;36m'    # Modern header color
    RESET='\033[0m'      # Reset to default terminal color

    echo -e "${RESET}================================${RESET}"
    echo -e "${CYAN}$1${RESET}"
    echo -e "${RESET}================================${RESET}"
}