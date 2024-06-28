import express from 'express';
import { createPost, getAllPosts, likePost } from '../controllers/postController.js';
import { updateProfile } from '../controllers/authController.js';
import { verifyToken } from '../middleware/authMiddleware.js';

const router = express.Router();

// Get all posts
router.get('/',getAllPosts);

// Create a new post
router.post('/',verifyToken, createPost);

// Add a comment to a post


// Update upvotes and downvotes
router.patch('/:id/vote', updateProfile);

// Like a post route
router.post('/:postId/like', likePost);

export default router;
