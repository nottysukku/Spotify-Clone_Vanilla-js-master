const express = require('express');
const { Pool } = require('pg');
const cors = require('cors');
const path = require('path');
require('dotenv').config();

const app = express();
// Update CORS configuration for production
app.use(cors({
    origin: process.env.FRONTEND_URL || '*', // Replace with your frontend URL in production
    methods: ['GET', 'POST', 'PUT', 'DELETE'],
    allowedHeaders: ['Content-Type'],
    credentials: true
}));
app.use(express.json());

// Update static file serving configuration
app.use('/covers', express.static(path.join(__dirname, '../public/covers')));
app.use('/songs', express.static(path.join(__dirname, '../public/songs')));
app.use(express.static(path.join(__dirname, '../public')));

const pool = new Pool({
    connectionString: process.env.DATABASE_URL,
    ssl: {
        rejectUnauthorized: false // You might want to set this to true in production with proper SSL certificates
    }
});

// Test database connection
pool.connect((err, client, release) => {
    if (err) {
        console.error('Error connecting to the database:', err.stack);
    } else {
        console.log('Connected to database successfully!');
        release();
    }
});

// Health check route
app.get('/api/health', (req, res) => {
    res.json({ status: 'ok', message: 'Server is running' });
});

// Get all albums
app.get('/api/albums', async (req, res) => {
    try {
        const result = await pool.query(`SELECT * FROM albums`);
        const baseUrl = process.env.AWS_ASSETS_URL || `${req.protocol}://${req.get('host')}`;
        
        const albums = result.rows.map(album => ({
            ...album,
            cover_url: `${baseUrl}/${album.cover_url.replace('public/', '')}`
        }));
        
        res.json(albums);
    } catch (err) {
        console.error('Error in /api/albums:', err);
        res.status(500).json({ error: err.message });
    }
});

// Get songs by album
app.get('/api/albums/:albumId/songs', async (req, res) => {
    try {
        const { albumId } = req.params;
        const result = await pool.query(`
            SELECT * FROM songs WHERE album_id = $1
        `, [albumId]);
        res.json(result.rows);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// Update port configuration for cloud deployment
const PORT = process.env.PORT || 3000;
app.listen(PORT, '0.0.0.0', () => {
    console.log(`Server running on port ${PORT} in ${process.env.NODE_ENV} mode`);
});
