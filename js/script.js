console.log('Lets write JavaScript');
let currentSong = new Audio();
let songs;

function secondsToMinutesSeconds(seconds) {
    if (isNaN(seconds) || seconds < 0) {
        return "00:00";
    }

    const minutes = Math.floor(seconds / 60);
    const remainingSeconds = Math.floor(seconds % 60);

    const formattedMinutes = String(minutes).padStart(2, '0');
    const formattedSeconds = String(remainingSeconds).padStart(2, '0');

    return `${formattedMinutes}:${formattedSeconds}`;
}

async function getSongs(albumId) {
    try {
        const response = await fetch(`${config.apiUrl}/api/albums/${albumId}/songs`);
        const songs = await response.json();
        console.log("Fetched songs:", songs);
        
        let songUL = document.querySelector(".songList").getElementsByTagName("ul")[0]
        songUL.innerHTML = ""
        for (const song of songs) {
            const songTitle = song.title || decodeURI(song.file_url.split('/').pop().replace(/\.[^/.]+$/, ""));
            songUL.innerHTML += `<li data-songurl="${song.file_url}">
                <img class="invert" width="34" src="img/music.svg" alt="">
                <div class="info">
                    <div>${songTitle}</div>
                </div>
                <div class="playnow">
                    <span>Play Now</span>
                    <img class="invert" src="img/play.svg" alt="">
                </div>
            </li>`;
        }

        // Update click handlers for songs
        Array.from(document.querySelector(".songList").getElementsByTagName("li")).forEach(e => {
            e.addEventListener("click", () => {
                const songUrl = e.dataset.songurl;
                if (songUrl) {
                    playMusic(songUrl);
                }
            });
        });

        return songs;
    } catch (error) {
        console.error("Error loading songs:", error);
        return [];
    }
}

const playMusic = (track, pause = false) => {
    // Add error handling for audio loading
    currentSong.onerror = (e) => {
        console.error("Error loading audio:", e);
        document.querySelector(".songinfo").innerHTML = "Error loading audio file";
    };

    currentSong.src = track;
    if (!pause) {
        currentSong.play().catch(e => {
            console.error("Error playing audio:", e);
            play.src = "img/play.svg";
        });
        play.src = "img/pause.svg";
    }
    document.querySelector(".songinfo").innerHTML = decodeURI(track.split('/').pop());
    document.querySelector(".songtime").innerHTML = "00:00 / 00:00";
}

async function displayAlbums() {
    try {
        console.log('Fetching albums...');
        const response = await fetch(`${config.apiUrl}/api/albums`);
        const albums = await response.json();
        console.log('Received albums:', albums);
        
        let cardContainer = document.querySelector(".cardContainer");
        cardContainer.innerHTML = "";
        
        for (const album of albums) {
            console.log(`Creating card for album: ${album.title}, cover URL: ${album.cover_url}`);
            cardContainer.innerHTML += `
                <div data-album-id="${album.id}" class="card">
                    <div class="play">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none"
                            xmlns="http://www.w3.org/2000/svg">
                            <path d="M5 20V4L19 12L5 20Z" stroke="#141B34" fill="#000" stroke-width="1.5"
                                stroke-linejoin="round" />
                        </svg>
                    </div>
                    <img src="${album.cover_url}" 
                         alt="${album.title}" 
                         onload="console.log('Image loaded successfully:', this.src)"
                         onerror="console.error('Failed to load image:', this.src); this.src='img/music.svg';">
                    <h2>${album.title}</h2>
                    <p>${album.description}</p>
                </div>`;
        }

        // After all cards are created, add additional image load monitoring
        document.querySelectorAll('.card img').forEach(img => {
            console.log('Monitoring image:', img.src);
            img.addEventListener('load', () => console.log('Image loaded via event listener:', img.src));
            img.addEventListener('error', () => console.error('Image failed via event listener:', img.src));
        });
        
        // Add click handlers to cards
        Array.from(document.getElementsByClassName("card")).forEach(e => { 
            e.addEventListener("click", async item => {
                console.log("Fetching Songs");
                songs = await getSongs(item.currentTarget.dataset.albumId);
                if (songs.length > 0) {
                    playMusic(songs[0].file_url);
                }
            });
        });
    } catch (error) {
        console.error("Error in displayAlbums:", error);
        document.querySelector(".cardContainer").innerHTML = "<p>Error loading albums</p>";
    }
}

async function main() {
    // Display all the albums on the page
    await displayAlbums();

    // Attach an event listener to play, next and previous
    play.addEventListener("click", () => {
        if (currentSong.paused) {
            currentSong.play();
            play.src = "img/pause.svg";
        } else {
            currentSong.pause();
            play.src = "img/play.svg";
        }
    });

    // Listen for timeupdate event
    currentSong.addEventListener("timeupdate", () => {
        document.querySelector(".songtime").innerHTML = `${secondsToMinutesSeconds(currentSong.currentTime)} / ${secondsToMinutesSeconds(currentSong.duration)}`;
        document.querySelector(".circle").style.left = (currentSong.currentTime / currentSong.duration) * 100 + "%";

        // Check if the song has reached its end
        if (currentSong.currentTime === currentSong.duration) {
            // Automatically play the next song if available
            let index = songs.findIndex(song => song.file_url === currentSong.src);
            if ((index + 1) < songs.length) {
                playMusic(songs[index + 1].file_url);
            }
        }
    });

    // Add an event listener to seekbar
    document.querySelector(".seekbar").addEventListener("click", e => {
        let percent = (e.offsetX / e.target.getBoundingClientRect().width) * 100;
        document.querySelector(".circle").style.left = percent + "%";
        currentSong.currentTime = ((currentSong.duration) * percent) / 100;
    });

    // Add an event listener for hamburger
    document.querySelector(".hamburger").addEventListener("click", () => {
        document.querySelector(".left").style.left = "0";
    });

    // Add an event listener for close button
    document.querySelector(".close").addEventListener("click", () => {
        document.querySelector(".left").style.left = "-120%";
    });

    // Add an event listener to previous
    previous.addEventListener("click", () => {
        currentSong.pause();
        console.log("Previous clicked");
        let index = songs.findIndex(song => song.file_url === currentSong.src);
        if ((index - 1) >= 0) {
            playMusic(songs[index - 1].file_url);
        }
    });

    currentSong.volume = 0.1; // Ensures that if a person opens app for first time, their ears don't bleed

    // Add an event to volume
    document.querySelector(".range").getElementsByTagName("input")[0].addEventListener("change", (e) => {
        console.log("Setting volume to", e.target.value, "/ 100");
        currentSong.volume = parseInt(e.target.value) / 100;
        if (currentSong.volume > 0) {
            document.querySelector(".volume>img").src = document.querySelector(".volume>img").src.replace("mute.svg", "volume.svg");
        }
    });

    // Add event listener to mute the track
    document.querySelector(".volume>img").addEventListener("click", e => { 
        if (e.target.src.includes("volume.svg")) {
            e.target.src = e.target.src.replace("volume.svg", "mute.svg");
            currentSong.volume = 0;
            document.querySelector(".range").getElementsByTagName("input")[0].value = 0;
        } else {
            e.target.src = e.target.src.replace("mute.svg", "volume.svg");
            currentSong.volume = .10;
            document.querySelector(".range").getElementsByTagName("input")[0].value = 10;
        }
    });

    // Add an event listener to next
    next.addEventListener("click", () => {
        currentSong.pause();
        console.log("Next clicked");

        let index = songs.findIndex(song => song.file_url === currentSong.src);
        if ((index + 1) < songs.length) {
            playMusic(songs[index + 1].file_url);
        }
    });
}

main();