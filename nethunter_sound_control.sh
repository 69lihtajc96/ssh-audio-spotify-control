#!/bin/bash

REMOTE_USER="user" # change you username/hostname
REMOTE_HOST="192.168.193.1" # change you IP

if ! command -v dialog &> /dev/null; then
    echo "Error: 'dialog' is not installed. Install it with: sudo apt install dialog"
    exit 1
fi

manage_volume() {
    while true; do
        choice=$(dialog --title "Volume Control" --menu "Select an option:" 15 50 4 \
            1 "Increase Volume (+5%)" \
            2 "Decrease Volume (-5%)" \
            3 "Show Current Volume" \
            4 "Back to Main Menu" --stdout)

        case $choice in
            1) ssh "$REMOTE_USER@$REMOTE_HOST" "amixer -D pulse sset Master 5%+" ;;
            2) ssh "$REMOTE_USER@$REMOTE_HOST" "amixer -D pulse sset Master 5%-" ;;
            3) 
                volume=$(ssh "$REMOTE_USER@$REMOTE_HOST" "amixer get Master | grep -o '[0-9]*%' | head -n 1")
                dialog --msgbox "Current Volume: $volume" 10 50 ;;
            4) return ;;
        esac
    done
}

spotify_control() {
    while true; do
        choice=$(dialog --title "Spotify Control" --menu "Select an option:" 15 50 6 \
            1 "Play/Pause" \
            2 "Next Track" \
            3 "Previous Track" \
            4 "Increase Spotify Volume" \
            5 "Decrease Spotify Volume" \
            6 "Back to Main Menu" --stdout)

        case $choice in
            1) ssh "$REMOTE_USER@$REMOTE_HOST" "playerctl -p spotify play-pause" ;;
            2) ssh "$REMOTE_USER@$REMOTE_HOST" "playerctl -p spotify next" ;;
            3) ssh "$REMOTE_USER@$REMOTE_HOST" "playerctl -p spotify previous" ;;
            4) ssh "$REMOTE_USER@$REMOTE_HOST" "amixer -D pulse sset Master 5%+" ;;
            5) ssh "$REMOTE_USER@$REMOTE_HOST" "amixer -D pulse sset Master 5%-" ;;
            6) return ;;
        esac
    done
}

main_menu() {
    while true; do
        choice=$(dialog --title "Nethunter Sound Control" --menu "Choose an action:" 15 50 4 \
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

main_menu
