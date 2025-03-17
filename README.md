# 🔊 Nethunter Sound Control Script
> 🇬🇧 English | [🇷🇺 Русский](README.ru.md)

---
# 🔊 Nethunter Sound Control Script

![Project](https://img.shields.io/badge/🔥%20%F0%9F%8E%A7%20Nethunter%20Sound%20Control%20🔥-SSH-blueviolet?style=for-the-badge)

### 🚨 THIS IS NOT JUST A SCRIPT — IT'S YOUR VOICE IN THE WORLD OF SSH!

---

## 🎯 Description

This script is a cross between a **DJ on steroids** and a **beat master**. It allows you to:

- 🔊 Control the volume of a remote system via SSH.
- 🎵 Control Spotify — pause, skip tracks forward/backward, and display the current track.
- 🔐 Operate through a secure SSH connection.
- 📋 Log everything that happens for troubleshooting.

---

## 🚀 Features
✅ Increase/decrease volume by command.  
✅ Show current volume in real-time.  
✅ Full Spotify control using `playerctl`.  
✅ Automatic configuration setup on first run.  
✅ Fast startup and easy setup.  

---

## 🛠️ Installation

### 📂 Clone the repo
```bash
git clone https://github.com/69lihtajc96/ssh-audio-spotify-control.git
cd ssh-audio-spotify-control
chmod +x spotify_sound_control.sh
```

### 📋 Install dependencies
- **NetHunter (Kali Linux):**
```bash
sudo apt install dialog openssh-client
```
- **Arch Linux:**
```bash
sudo pacman -S dialog openssh
```
- **Debian/Ubuntu:**
```bash
sudo apt install dialog openssh-client
```

### 🛠️ Configuration
On the first run, the script will ask you to provide:
- 👤 **Remote Username** (e.g., `root`).
- 🌍 **Remote Host IP** (e.g., `192.168.1.100`).

These details are saved in the configuration file:  
```bash
/root/.soundctl.conf
```

---

## 🎯 Usage
```bash
./spotify_sound_control.sh
```

### 🔥 Main Menu
1️⃣ **Volume Control** — manage system volume.  
2️⃣ **Spotify Control** — manage Spotify playback.  
3️⃣ **Exit** — exit the script.  

### 🔊 Volume Control Menu
1️⃣ **Increase Volume** — +5% volume.  
2️⃣ **Decrease Volume** — -5% volume.  
3️⃣ **Show Current Volume** — display current volume.  
4️⃣ **Back to Main Menu** — return to the main menu.  

### 🎵 Spotify Control Menu
1️⃣ **Play/Pause** — pause or resume playback.  
2️⃣ **Next Track** — skip to the next track.  
3️⃣ **Previous Track** — skip to the previous track.  
4️⃣ **Show Current Track** — show the currently playing track.  
5️⃣ **Back to Main Menu** — return to the main menu.  

---

## ❗ Troubleshooting (if things go south)

🚫 **"Error: Cannot connect to [IP]"** → Ensure the SSH service is running on the remote machine:  
```bash
sudo systemctl start ssh
```

🔊 **"Failed to retrieve volume"** → Ensure `amixer` is installed on the remote system:  
```bash
sudo apt install alsa-utils
```

🎵 **Spotify unresponsive** → Ensure `playerctl` is installed on the remote machine:  
```bash
sudo apt install playerctl
```

---

## 🤝 Contributing

Ideas, improvements, and feedback are welcome! Fork it, submit a pull request — and let's rock! 🚀

---

## 📜 License
This project is licensed under the **MIT License** — enjoy and have fun! 😎

