import express from 'express';
import { verifyToken } from '../middleware/authMiddleware.js';
import { getUserDetails } from '../controllers/userController.js';
const router = express.Router();

// Route to get user details (requires authentication)
router.get('/:userId',verifyToken,  getUserDetails);

export default router;
