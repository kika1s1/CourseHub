
import mongoose from 'mongoose';

const postSchema = new mongoose.Schema({
    title: { 
        type: String, 
        required: true 
    },
    author: {
        type: mongoose.Schema.Types.ObjectId, 
        ref: 'User', required: true 
    },
    description: { 
        type: String, 
        required: true 
    },
    image: { 
        type: String 
    }, // Add the image field
    comment: [
        { 
        type: mongoose.Schema.Types.ObjectId, 
        ref: 'Comment' }
    ]
});

const Post = mongoose.model('Post', postSchema);

export default Post;
