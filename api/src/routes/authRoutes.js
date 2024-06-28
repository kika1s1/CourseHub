// POST /api/users/register: Register a new user
// POST /api/users/login: User login
// GET /api/users/:userId: Get user details
// PUT /api/users/:userId: Update user details
// DELETE /api/users/:userId: Delete a user


import express from 'express';
import { register, login, logout, updateProfile, getCurrentUserDetails } from '../controllers/authController.js';
import { verifyToken } from '../middleware/authMiddleware.js';
// import { getCurrentUserDetails } from '../controllers/users.js';

const authRouter = express.Router();

// User registration
authRouter.post('/register', register);

// User login
authRouter.post('/login', login);

// current user
authRouter.get('/me',  verifyToken, getCurrentUserDetails);

// User profile update
authRouter.put('/me', verifyToken, updateProfile);

// User logout
authRouter.post('/logout', logout);

export default authRouter;