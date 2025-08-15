# 🔊 Музыкальный контроллер в терминале с CAVA
> [🇬🇧 English](./README.md) | 🇷🇺 Русский

![Project](https://img.shields.io/badge/🔥%20Terminal%20Music%20Controller%20🔥-SSH-red?style=for-the-badge)

### 🚨 ЭТО НЕ ПРОСТО СКРИПТ — ЭТО ТВОЙ ТЕРМИНАЛ, КОТОРЫЙ ИГРАЕТ!

---

## 🎯 Описание

Интерактивный **терминальный интерфейс на Python** для управления музыкой через SSH.  
Совмещает **управление Spotify**, **регулировку громкости системы** и **живой визуализатор CAVA** в одном окне.

---

## 🚀 Возможности

✅ Живой **визуализатор CAVA** с красными барами и белым контуром.  
✅ Регулировка количества баров ← / →.  
✅ **Большие кнопки**, удобные для нажатия пальцем в Termux.  
✅ **Автопрокрутка длинных треков**.  
✅ Полный контроль Spotify через `playerctl`.  
✅ Регулировка громкости через PulseAudio.  
✅ Отлично работает по SSH, включая Termux на Android.  

---

## 🛠️ Установка

### 📂 Клонировать репозиторий
```bash
git clone https://github.com/69lihtajc96/ssh-cava-spotify-control.git
cd ssh-cava-spotify-control
````

### 📋 Установить зависимости

* **Debian/Ubuntu/Kali/NetHunter**:

```bash
sudo apt install python3 python3-pip pulseaudio-utils playerctl cava
pip3 install pulsectl
```

* **Arch Linux**:

```bash
sudo pacman -S python python-pip pulseaudio playerctl cava
pip install pulsectl
```

---

## 🎯 Использование

```bash
python3 [music_tui.py](./music_tui.py)
```

**Управление:**

* **Клик мышкой** — кнопки (Prev / Play-Pause / Next / Volume +/-)
* **← / →** — изменить количество баров CAVA
* **q** или **ESC** — выход

---

## ❗ Возможные проблемы

🚫 **CAVA не работает** → Проверь, установлен ли [`cava`](https://github.com/karlstav/cava) и запускается ли он отдельно.

🔊 **Громкость не меняется** → Установи [`pulsectl`](https://pypi.org/project/pulsectl/) и проверь, запущен ли PulseAudio.

🎵 **Spotify не реагирует** → Проверь, что [`playerctl`](https://github.com/altdesktop/playerctl) управляет плеером:

```bash
playerctl -p spotify play-pause
```

---

## 📜 Лицензия

[MIT License](./LICENSE) — используй и получай удовольствие! 🎶
