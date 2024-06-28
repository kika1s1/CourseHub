import express from 'express';
import { addCommentToPost } from '../controllers/commentController.js';
import { verifyToken } from '../middleware/authMiddleware.js';

const router = express.Router();

// Add comment to a post
// api/comments
router.post('/:postId',verifyToken, addCommentToPost);

export default router;