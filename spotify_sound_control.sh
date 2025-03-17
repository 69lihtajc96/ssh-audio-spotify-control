#!/bin/bash

# ================== Константы ==================
CONFIG_FILE="/root/.soundctl.conf"
LOG_FILE="/root/.soundctl.log"
VOLUME_STEP=5%
DIALOG_HEIGHT=15
DIALOG_WIDTH=50
SSH_TIMEOUT=5

# ================== Функции ==================
log_action() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
}

check_dependencies() {
    for cmd in dialog ssh; do
        if ! command -v "$cmd" &>/dev/null; then
            echo "Error: '$cmd' is not installed. Install it with: sudo apt install $cmd" >&2
            exit 1
        fi
    done
}

check_ssh_connection() {
    ssh -o ConnectTimeout=$SSH_TIMEOUT "$REMOTE_USER@$REMOTE_HOST" exit 2>/dev/null
    if [ $? -ne 0 ]; then
        dialog --msgbox "Error: Cannot connect to $REMOTE_USER@$REMOTE_HOST" $DIALOG_HEIGHT $DIALOG_WIDTH
        exit 1
    fi
}

load_config() {
    if [ -f "$CONFIG_FILE" ]; then
        source "$CONFIG_FILE"
    else
        dialog --inputbox "Enter Remote Username:" $DIALOG_HEIGHT $DIALOG_WIDTH 2>temp_user
        REMOTE_USER=$(<temp_user)
        dialog --inputbox "Enter Remote Host IP:" $DIALOG_HEIGHT $DIALOG_WIDTH 2>temp_host
        REMOTE_HOST=$(<temp_host)
        echo "REMOTE_USER=$REMOTE_USER" > "$CONFIG_FILE"
        echo "REMOTE_HOST=$REMOTE_HOST" >> "$CONFIG_FILE"
    fi
}

ssh_exec() {
    echo "Executing: ssh -o ConnectTimeout=$SSH_TIMEOUT $REMOTE_USER@$REMOTE_HOST $1" >> "$LOG_FILE"
    ssh -o ConnectTimeout=$SSH_TIMEOUT "$REMOTE_USER@$REMOTE_HOST" "$1"
    if [ $? -ne 0 ]; then
        log_action "SSH command failed: $1"
        return 1
    fi
}

manage_volume() {
    while true; do
        choice=$(dialog --title "Volume Control" --menu "Select an option:" $DIALOG_HEIGHT $DIALOG_WIDTH 4 \
            1 "Increase Volume (+$VOLUME_STEP)" \
            2 "Decrease Volume (-$VOLUME_STEP)" \
            3 "Show Current Volume" \
            4 "Back to Main Menu" --stdout)

        case $choice in
            1) ssh_exec "amixer -D pulse sset Master $VOLUME_STEP+" || log_action "Volume increase failed" ;;
            2) ssh_exec "amixer -D pulse sset Master $VOLUME_STEP-" || log_action "Volume decrease failed" ;;
            3) 
                volume=$(ssh_exec "amixer get Master | grep -o '[0-9]*%' | head -n 1")
                if [ -n "$volume" ]; then
                    dialog --msgbox "Current Volume: $volume" $DIALOG_HEIGHT $DIALOG_WIDTH
                else
                    dialog --msgbox "Failed to retrieve volume" $DIALOG_HEIGHT $DIALOG_WIDTH
                fi
                ;;
            4) return ;;
        esac
    done
}

spotify_control() {
    while true; do
        choice=$(dialog --title "Spotify Control" --menu "Select an option:" $DIALOG_HEIGHT $DIALOG_WIDTH 6 \
            1 "Play/Pause" \
            2 "Next Track" \
            3 "Previous Track" \
            4 "Show Current Track" \
            5 "Back to Main Menu" --stdout)

        case $choice in
            1) ssh_exec "playerctl -p spotify play-pause" || log_action "Spotify Play/Pause failed" ;;
            2) ssh_exec "playerctl -p spotify next" || log_action "Spotify Next failed" ;;
            3) ssh_exec "playerctl -p spotify previous" || log_action "Spotify Previous failed" ;;
            4)
                track_info=$(ssh_exec "playerctl -p spotify metadata --format '{{ artist }} - {{ title }}'")
                if [ -n "$track_info" ]; then
                    dialog --msgbox "Now Playing: $track_info" $DIALOG_HEIGHT $DIALOG_WIDTH
                else
                    dialog --msgbox "No track information available" $DIALOG_HEIGHT $DIALOG_WIDTH
                fi
                ;;
            5) return ;;
        esac
    done
}

main_menu() {
    while true; do
        choice=$(dialog --title "Nethunter Sound Control" --menu "Choose an action:" $DIALOG_HEIGHT $DIALOG_WIDTH 4 \
            1 "Volume Control" \
            2 "Spotify Control" \
            3 "Exit" --stdout)

        case $choice in
            1) manage_volume ;;
            2) spotify_control ;;
            3) clear; exit 0 ;;
        esac
    done
}

trap "clear; echo 'Script interrupted'; exit 1" SIGINT SIGTERM

# ================== Запуск ==================
check_dependencies
load_config
check_ssh_connection
main_menu
