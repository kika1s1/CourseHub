import dotenv from 'dotenv'
dotenv.config({})
import mongoose from 'mongoose';

const dbConnect = async () => {
    try {
        const dbURI = process.env.dbURI;
        await mongoose.connect(dbURI);
        
        console.log('Database connected successfully');
    } catch (error) {
        console.error('Database connection error:', error.message);
    }
};

export default dbConnect;
