# 🎛️ Nethunter SSH Audio & Spotify Control
A terminal-based audio management tool for **Kali Nethunter** with SSH integration.  
Control **system volume**, **Spotify playback**, and **remote audio settings** using a minimal terminal interface powered by `dialog`.

---

## 🚀 **Features:**
- 🎧 **Full Spotify Control:** Play, pause, skip tracks, and adjust Spotify volume.  
- 🔊 **Volume Management:** Increase, decrease, and view current system volume.  
- 📶 **Remote SSH Control:** Manage sound settings of a remote machine using SSH.  
- ✅ **Clean UI:** Simple and interactive `dialog`-based interface.  
- 🎹 **Hotkey Support:** Bind custom keys for controlling Spotify playback.  

---

## 📦 **Installation:**

### **Step 1: Clone the Repository**
```bash
git clone https://github.com/69lihtajc96/ssh-audio-spotify-control.git
```
```bash
cd ssh-audio-spotify-control
```
```bash
chmod +x nethunter_sound_control.sh
```
```bash
sudo cp nethunter_sound_control.sh /usr/local/bin/soundctl
```

### **Step 2: Ensure Required Packages Are Installed**
```bash
sudo apt update
```
```bash
sudo apt install dialog openssh-client playerctl
```
```bash
amixer xbindkeys
```

### **Step 3: SSH Key Setup (for passwordless connection)**
```bash
ssh-keygen -t rsa -b 4096
```
```bash
ssh-copy-id user@192.168.193.1
```
```bash
ssh user@192.168.193.1
```

---

## 🎹 **Hotkey Setup for Spotify Control (Super+Ctrl+Alt)**

### **Step 1: Install `xbindkeys`**
```bash
sudo apt install xbindkeys
```

### **Step 2: Create the Config File for Hotkeys**
```bash
nano ~/.xbindkeysrc
```

### **Step 3: Configure Hotkeys for Spotify Control**
```plaintext
# Increase Spotify Volume
"ssh user@192.168.193.1 amixer -D pulse sset Master 5%+"
    Mod4+Control+Alt+Right

# Decrease Spotify Volume
"ssh user@192.168.193.1 amixer -D pulse sset Master 5%-"
    Mod4+Control+Alt+Left

# Play/Pause Spotify
"ssh user@192.168.193.1 playerctl -p spotify play-pause"
    Mod4+Control+Alt+J

# Next Track
"ssh user@192.168.193.1 playerctl -p spotify next"
    Mod4+Control+Alt+K

# Previous Track
"ssh user@192.168.193.1 playerctl -p spotify previous"
    Mod4+Control+Alt+H
```

### **Step 4: Reload `xbindkeys`**
```bash
xbindkeys --poll-rc
```

### **Step 5: Auto Start `xbindkeys` (Optional)**
```bash
echo "xbindkeys" >> ~/.bashrc
```
```bash
source ~/.bashrc
```

---

## 📊 **Usage:**
### **Run the utility:**
```bash
soundctl
```

### **Main Menu Options:**
- **Volume Control:** Adjust system volume and view current levels.  
- **Spotify Control:** Manage playback and volume for the Spotify player.  

---

## 🔒 **Security Best Practices:**
- ✅ **Use `ssh-agent` for better security.**  
- ✅ **Avoid storing SSH passphrases directly in scripts.**  
- ✅ **Use a strong SSH key with a passphrase and `ssh-agent`.**

---

## 📄 **License:**
```plaintext
MIT License
```
This project is licensed under the MIT License – you are free to use, modify, and distribute it.

---

## 🤝 **Contributing:**
Pull requests are welcome! Feel free to create issues or suggest improvements.

---

## 👨‍💻 **Author:**
**Created by:** [69lihtajc96](https://github.com/69lihtajc96)  
