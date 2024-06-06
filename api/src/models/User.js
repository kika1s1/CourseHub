import mongoose from "mongoose";
import bcrypt from "bcryptjs";

import mongoose from "mongoose";

import mongoose from 'mongoose';

const userSchema = new mongoose.Schema({
  name: { type: String, required: true },
  email: { type: String, required: true, unique: true },
  password: { type: String, required: true },
  profile_picture: { type: String },
  bio: { type: String },
  department: { type: String },
  username: { type: String },
  gender: { type: String, enum: ['Male', 'Female', 'Other'] },
  is_teacher: { type: Boolean, default: false },
  is_verified: { type: Boolean, default: false },
  created_at: { type: Date, default: Date.now },
  updated_at: { type: Date, default: Date.now }
});


