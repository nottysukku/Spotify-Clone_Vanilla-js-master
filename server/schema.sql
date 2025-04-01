CREATE TABLE albums (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    cover_url TEXT,
    folder_name VARCHAR(255)
);

CREATE TABLE songs (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    file_url TEXT NOT NULL,
    album_id INTEGER REFERENCES albums(id),
    duration INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample data
INSERT INTO albums (title, description, cover_url, folder_name) 
VALUES 
    ('NCS Album', 'No Copyright Sounds', '/songs/ncs/cover.jpg', 'ncs'),
    ('Get up', 'You can do it!', '/songs/Uplifting_(mood)/cover.jpg', 'Uplifting_(mood)'),
    ('I Love You', 'Love is in the air', '/songs/Love_(mood)/cover.jpg', 'Love_(mood)'),
    ('Go Funky', 'Lets go Funky', '/songs/Funky_(mood)/cover.jpg', 'Funky_(mood)'),
    ('Diljit Dosanjh', 'Diljit for You', '/songs/Diljit/cover.jpg', 'Diljit'),
    ('Dark Songs', 'Dark Songs for you', '/songs/Dark_(mood)/cover.jpg', 'Dark_(mood)'),
    ('Motivational Songs', 'Motivational Songs for you', '/songs/cs/cover.jpg', 'cs'),
    ('Just Chill', 'Yes, Just Chill', '/songs/Chill_(mood)/cover.jpg', 'Chill_(mood)'),
    ('Bright Songs', 'Bright Songs for you', '/songs/Bright_(mood)/cover.jpg', 'Bright_(mood)'),
    ('Arjit Singh', 'Arjit Singh for You', '/songs/Arjit_Singh/cover.jpg', 'Arjit_Singh'),
    ('Angry Mood', 'Calm your Anger', '/songs/Angry_(mood)/cover.jpg', 'Angry_(mood)');

INSERT INTO songs (title, file_url, album_id) 
VALUES 
    -- NCS Songs
    ('NCS Song 1', '/songs/ncs/song1.mp3', 1),
    ('NCS Song 2', '/songs/ncs/song2.mp3', 1),

    -- Uplifting Mood Songs
    ('Uplifting Song 1', '/songs/Uplifting_(mood)/song1.mp3', 2),
    ('Uplifting Song 2', '/songs/Uplifting_(mood)/song2.mp3', 2),

    -- Love Mood Songs
    ('Love Song 1', '/songs/Love_(mood)/song1.mp3', 3),
    ('Love Song 2', '/songs/Love_(mood)/song2.mp3', 3),

    -- Funky Mood Songs
    ('Funky Song 1', '/songs/Funky_(mood)/song1.mp3', 4),
    ('Funky Song 2', '/songs/Funky_(mood)/song2.mp3', 4),

    -- Diljit Songs
    ('Diljit Song 1', '/songs/Diljit/song1.mp3', 5),
    ('Diljit Song 2', '/songs/Diljit/song2.mp3', 5),

    -- Dark Mood Songs
    ('Dark Song 1', '/songs/Dark_(mood)/song1.mp3', 6),
    ('Dark Song 2', '/songs/Dark_(mood)/song2.mp3', 6),

    -- Motivational Songs
    ('Motivational Song 1', '/songs/cs/song1.mp3', 7),
    ('Motivational Song 2', '/songs/cs/song2.mp3', 7),

    -- Chill Mood Songs
    ('Chill Song 1', '/songs/Chill_(mood)/song1.mp3', 8),
    ('Chill Song 2', '/songs/Chill_(mood)/song2.mp3', 8),

    -- Bright Mood Songs
    ('Bright Song 1', '/songs/Bright_(mood)/song1.mp3', 9),
    ('Bright Song 2', '/songs/Bright_(mood)/song2.mp3', 9),

    -- Arjit Singh Songs
    ('Arjit Song 1', '/songs/Arjit_Singh/song1.mp3', 10),
    ('Arjit Song 2', '/songs/Arjit_Singh/song2.mp3', 10),

    -- Angry Mood Songs
    ('Angry Song 1', '/songs/Angry_(mood)/song1.mp3', 11),
    ('Angry Song 2', '/songs/Angry_(mood)/song2.mp3', 11);
