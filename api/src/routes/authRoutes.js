// POST /api/users/register: Register a new user
// POST /api/users/login: User login
// GET /api/users/:userId: Get user details
// PUT /api/users/:userId: Update user details
// DELETE /api/users/:userId: Delete a user


import express from 'express';
import { register, login, logout } from '../controllers/authController.js';

const authRouter = express.Router();

// User registration
authRouter.post('/register', register);

// User login
authRouter.post('/login', login);

// User logout
authRouter.post('/logout', logout);

export default authRouter;