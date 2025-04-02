const config = {
    apiUrl: process.env.NODE_ENV === 'production' 
        ? 'https://new-folder-beryl-eta.vercel.app/' // Replace with your deployed backend URL  
        : 'http://localhost:3000'
};
