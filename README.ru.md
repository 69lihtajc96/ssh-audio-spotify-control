# 🔊 Nethunter Sound Control Script
> [🇬🇧 English](README.md) | 🇷🇺 Русский

---
# 🔊 Nethunter Sound Control Script

![Проект](https://img.shields.io/badge/🔥%20%F0%9F%8E%A7%20Nethunter%20Sound%20Control%20🔥-SSH-blueviolet?style=for-the-badge)

### 🚨 ЭТО НЕ ПРОСТО СКРИПТ — ЭТО ВАШ ГОЛОС В МИРЕ SSH!

---

## 🎯 Описание

Этот скрипт — нечто среднее между **DJ на стероидах** и **повелителем битов**. Он позволяет:

- 🔊 Управлять громкостью удаленной системы по SSH.
- 🎵 Управлять Spotify — пауза, треки вперёд/назад, просмотр текущей композиции.
- 🔐 Работает через безопасное SSH-соединение.
- 📋 Логирует всё происходящее для разбора косяков и неожиданностей.

---

## 🚀 Фичи
✅ Увеличение/уменьшение громкости командой.  
✅ Показ текущей громкости в реальном времени.  
✅ Полный контроль Spotify с помощью `playerctl`.  
✅ Автоматическая настройка конфигурации при первом запуске.  
✅ Быстрый запуск и простая настройка.  

---

## 🛠️ Установка

### 📂 Клонирование репо
```bash
git clone https://github.com/69lihtajc96/ssh-audio-spotify-control.git
cd ssh-audio-spotify-control
chmod +x spotify_sound_control.sh
```

### 📋 Установка зависимостей
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

### 🛠️ Настройка
При первом запуске скрипт спросит:
- 👤 **Имя удаленного пользователя** (например, `root`).
- 🌍 **IP-адрес удаленного хоста** (например, `192.168.1.100`).

Эти данные сохраняются в конфигурационном файле:  
```bash
/root/.soundctl.conf
```

---

## 🎯 Использование
```bash
./spotify_sound_control.sh
```

### 🔥 Главное меню
1️⃣ **Volume Control** — управление громкостью.  
2️⃣ **Spotify Control** — управление воспроизведением Spotify.  
3️⃣ **Exit** — выход из скрипта.  

### 🔊 Меню управления громкостью
1️⃣ **Increase Volume** — +5% громкости.  
2️⃣ **Decrease Volume** — -5% громкости.  
3️⃣ **Show Current Volume** — отображение текущей громкости.  
4️⃣ **Back to Main Menu** — возврат в главное меню.  

### 🎵 Меню управления Spotify
1️⃣ **Play/Pause** — пауза или продолжение воспроизведения.  
2️⃣ **Next Track** — следующий трек.  
3️⃣ **Previous Track** — предыдущий трек.  
4️⃣ **Show Current Track** — показать, что сейчас играет.  
5️⃣ **Back to Main Menu** — возврат в главное меню.  

---

## ❗ Troubleshooting (если вдруг всё пошло по одному месту)

🚫 **"Error: Cannot connect to [IP]"** → Убедитесь, что SSH-сервис работает на удаленной машине:  
```bash
sudo systemctl start ssh
```

🔊 **"Failed to retrieve volume"** → Убедитесь, что на удалённой системе установлен `amixer`:  
```bash
sudo apt install alsa-utils
```

🎵 **Spotify не реагирует** → Проверьте, установлен ли `playerctl` на удаленной машине:  
```bash
sudo apt install playerctl
```

---

## 🤝 Contributing

Идеи, улучшения и реплики приветствуются! Форкай, пулл-реквест — и поехали! 🚀

---

## 📜 Лицензия
Этот проект распространяется по лицензии **MIT** — пользуйтесь на здоровье! 😎

