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
    album_id INTEGER REFERENCES albums(id)
);

-- Insert sample data
INSERT INTO albums (title, description, cover_url, folder_name) 
VALUES 
    ('Angry Mood', 'Calm your Anger', '/songs/Angry_(mood)/cover1.jpg', 'Angry_(mood)'),
    ('Arjit Singh', 'Arjit Singh for You', '/songs/Arjit_Singh/cover2.jpg', 'Arjit_Singh'),
    ('Bright Songs', 'Bright Songs for you', '/songs/Bright_(mood)/cover3.jpg', 'Bright_(mood)'),
    ('Just Chill', 'Yes, Just Chill', '/songs/Chill_(mood)/cover4.jpg', 'Chill_(mood)'),
    ('Motivational Songs', 'Motivational Songs for you', '/songs/cs/cover5.jpg', 'cs'),
    ('Dark Songs', 'Dark Songs for you', '/songs/Dark_(mood)/cover6.jpg', 'Dark_(mood)'),
    ('Diljit Dosanjh', 'Diljit for You', '/songs/Diljit/cover7.jpg', 'Diljit'),
    ('Go Funky', 'Lets go Funky', '/songs/Funky_(mood)/cover8.jpg', 'Funky_(mood)'),
    ('I Love You', 'Love is in the air', '/songs/Love_(mood)/cover9.jpg', 'Love_(mood)'),
    ('NCS Album', 'No Copyright Sounds', '/songs/ncs/cover10.jpg', 'ncs'),
    ('Get up', 'You can do it!', '/songs/Uplifting_(mood)/cover11.jpg', 'Uplifting_(mood)');

INSERT INTO songs (title, file_url, album_id) 
VALUES 
    ('I Stand Alone', '/songs/Angry_(mood)/01I Stand Alone - Godsmack.mp3', 1),
    ('Rooftops', '/songs/Angry_(mood)/Rooftops Marshmello.mp3', 1),
    ('Arjit Song 1', '/songs/Arjit_Singh/dil_sambal.mp3', 2),
    ('011-Mike Posner - I Took A Pill In Ibiza', '/songs/Bright_(mood)/011-Mike Posner - I Took A Pill In Ibiza.mp3', 3),
    ('Flashbacks Marshmello', '/songs/Bright_(mood)/Flashbacks Marshmello.mp3', 3),
    ('1She Will Be Loved - Maroon 5', '/songs/Chill_(mood)/1She Will Be Loved - Maroon 5.mp3', 4),
    ('Young, Wild, And Free-Snoop Dogg & Wiz Khalifa', '/songs/cs/Young, Wild, And Free-Snoop Dogg & Wiz Khalifa.mp3', 5),
    ('Zedd_Maren_Morris_Grey_-_The_Middle_NaijaExclusive.net', '/songs/cs/Zedd_Maren_Morris_Grey_-_The_Middle_NaijaExclusive.net.mp3', 5),
    ('1Still D.R.E Snoop Dogg', '/songs/Dark_(mood)/1Still D.R.E Snoop Dogg.mp3', 6),
    ('Attention - Charlie Puth', '/songs/Dark_(mood)/Attention - Charlie Puth.mp3', 6),
    ('1Lover', '/songs/Diljit/1Lover.mp3', 7),
    ('1Im blue   Eiffel', '/songs/Funky_(mood)/1Im blue   Eiffel.mp3', 8),
    ('01The-Beatles-Something', '/songs/Love_(mood)/01The-Beatles-Something.mp3', 9),
    ('83. Khalid - Saturday Nights (1)', '/songs/Love_(mood)/83. Khalid - Saturday Nights (1).mp3', 9),
    ('1- Khalid - Love Lies', '/songs/ncs/1- Khalid - Love Lies.mp3', 10),
    ('1Imagine Dragons-Battle Cry (Clean)', '/songs/Uplifting_(mood)/1Imagine Dragons-Battle Cry (Clean).mp3', 11);

-- Update the cover_url paths in the albums table
UPDATE albums SET cover_url = 'public/covers/cover1.jpg' WHERE folder_name = 'Angry_(mood)';
UPDATE albums SET cover_url = 'public/covers/cover2.jpg' WHERE folder_name = 'Arjit_Singh';
UPDATE albums SET cover_url = 'public/covers/cover3.jpg' WHERE folder_name = 'Bright_(mood)';
UPDATE albums SET cover_url = 'public/covers/cover4.jpg' WHERE folder_name = 'Chill_(mood)';
UPDATE albums SET cover_url = 'public/covers/cover5.jpg' WHERE folder_name = 'cs';
UPDATE albums SET cover_url = 'public/covers/cover6.jpg' WHERE folder_name = 'Dark_(mood)';
UPDATE albums SET cover_url = 'public/covers/cover7.jpg' WHERE folder_name = 'Diljit';
UPDATE albums SET cover_url = 'public/covers/cover8.jpg' WHERE folder_name = 'Funky_(mood)';
UPDATE albums SET cover_url = 'public/covers/cover9.jpg' WHERE folder_name = 'Love_(mood)';
UPDATE albums SET cover_url = 'public/covers/cover10.jpg' WHERE folder_name = 'ncs';
UPDATE albums SET cover_url = 'public/covers/cover11.jpg' WHERE folder_name = 'Uplifting_(mood)';

UPDATE songs SET file_url = 'public/songs/Angry_(mood)/01I Stand Alone - Godsmack.mp3' WHERE folder_name = 'Angry_(mood)';
UPDATE songs SET file_url = 'public/songs/Angry_(mood)/Rooftops Marshmello.mp3' WHERE folder_name = 'Angry_(mood)';
UPDATE songs SET file_url = 'public/songs/Arjit_Singh/dil_sambal.mp3' WHERE folder_name = 'Arjit_Singh';
UPDATE songs SET file_url = 'public/songs/Bright_(mood)/011-Mike Posner - I Took A Pill In Ibiza.mp3' WHERE folder_name = 'Bright_(mood)';
UPDATE songs SET file_url = 'public/songs/Bright_(mood)/Flashbacks Marshmello.mp3' WHERE folder_name = 'Bright_(mood)';
UPDATE songs SET file_url = 'public/songs/Chill_(mood)/1She Will Be Loved - Maroon 5.mp3' WHERE folder_name = 'Chill_(mood)';
UPDATE songs SET file_url = 'public/songs/cs/Young, Wild, And Free-Snoop Dogg & Wiz Khalifa.mp3' WHERE folder_name = 'cs';
UPDATE songs SET file_url = 'public/songs/cs/Zedd_Maren_Morris_Grey_-_The_Middle_NaijaExclusive.net.mp3' WHERE folder_name = 'cs';
UPDATE songs SET file_url = 'public/songs/Dark_(mood)/1Still D.R.E Snoop Dogg.mp3' WHERE folder_name = 'Dark_(mood)';
UPDATE songs SET file_url = 'public/songs/Dark_(mood)/Attention - Charlie Puth.mp3' WHERE folder_name = 'Dark_(mood)';
UPDATE songs SET file_url = 'public/songs/Diljit/1Lover.mp3' WHERE folder_name = 'Diljit';
UPDATE songs SET file_url = 'public/songs/Funky_(mood)/1Im blue   Eiffel.mp3' WHERE folder_name = 'Funky_(mood)';
UPDATE songs SET file_url = 'public/songs/Love_(mood)/01The-Beatles-Something.mp3' WHERE folder_name = 'Love_(mood)';
UPDATE songs SET file_url = 'public/songs/Love_(mood)/83. Khalid - Saturday Nights (1).mp3' WHERE folder_name = 'Love_(mood)';
UPDATE songs SET file_url = 'public/songs/ncs/1- Khalid - Love Lies.mp3' WHERE folder_name = 'ncs';
UPDATE songs SET file_url = 'public/songs/Uplifting_(mood)/1Imagine Dragons-Battle Cry (Clean).mp3' WHERE folder_name = 'Uplifting_(mood)';
