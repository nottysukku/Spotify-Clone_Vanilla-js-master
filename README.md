# 🎵 Spotify Clone

![HTML5](https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/css3-%231572B6.svg?style=for-the-badge&logo=css3&logoColor=white)
![JavaScript](https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E)

A sleek and responsive Spotify clone built with vanilla JavaScript! 🚀

## ✨ Features

- 🎧 Play/Pause functionality
- ⏭️ Next/Previous track navigation
- 🔄 Auto-play next song
- 🔊 Volume control with mute option
- 📱 Responsive design
- 📂 Multiple album support
- 🎨 Clean and modern UI

## 🛠️ Tech Stack

- HTML5
- CSS3
- Vanilla JavaScript
- SVG Icons
- Local Storage API

## 🚀 Getting Started

### Prerequisites
- PostgreSQL installed and running
- Node.js installed

### Setup Instructions

1. Set up the database:
```bash
# Login to PostgreSQL
psql -U postgres

# Create a new database
CREATE DATABASE spotify_clone;

# Connect to the database
\c spotify_clone

# Run the schema.sql file
\i server/schema.sql
```

2. Install dependencies:
```bash
# Navigate to the server directory
cd server

# Install dependencies
npm install
```

3. Configure environment variables:
Create a `.env` file in the server directory with:
```
DB_USER=postgres
DB_PASSWORD=your_password
DB_HOST=localhost
DB_PORT=5432
DB_NAME=spotify_clone
PORT=3000
```

4. Start the server:
```bash
npm start
```

5. Open the application:
- Open `index.html` in your web browser
- Or use a local development server like Live Server in VS Code

## 📁 Project Structure

```
├── 📂 css/
│   └── style.css
├── 📂 img/
│   └── (icons & images)
├── 📂 js/
│   └── script.js
├── 📂 songs/
│   ├── album1/
│   ├── album2/
│   └── ...
├── 📂 server/
│   ├── schema.sql
│   ├── .env
│   └── (server code files)
└── 📄 index.html
```

## 🎮 Controls

- ⏯️ Play/Pause: Click play button or spacebar
- ⏭️ Next Song: Click next button or right arrow
- ⏮️ Previous Song: Click previous button or left arrow
- 🔊 Volume: Use slider or up/down arrows
- 🔇 Mute: Click volume icon

## 🤝 Contributing

Pull requests are welcome! Feel free to contribute to this project.

## 📝 License

This project is open source and available under the [MIT License](LICENSE).

## 💖 Acknowledgments

- Inspired by Spotify's clean UI
- Icons from [SVG Repo](https://www.svgrepo.com/)
- Music from [NCS](https://ncs.io/)

---
Made with 💚 and JavaScript




