import bcrypt from "bcryptjs";
import jwt from "jsonwebtoken";
import User from "../models/User.js";
import dotenv from "dotenv";
dotenv.config({});
// User registration
export const register = async (req, res) => {
  try {
    // console.log(req.body)
    const { name,username, department, email, password } = req.body;

    // Check if the user already exists
    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return res.status(400).json({ message: "User already exists" });
    }

    // Hash the password
    const hashedPassword = await bcrypt.hash(password, 10);

    // Create a new user
    const user = new User({
      username, 
      department,
      name,
      email,
      password: hashedPassword,
    });

    // Save the user to the database
    await user.save();

    res.status(201).json({ message: "User registered successfully" });
  } catch (error) {
    console.log(error);
    res.status(500).json({ message: "Registration failed" });
  }
};

// User login
export const login = async (req, res) => {
  try {
    const { email, password } = req.body;

    // Check if the user exists
    const user = await User.findOne({ email });
    if (!user) {
      return res.status(404).json({ message: "User not found" });
    }

    // Compare passwords
    const isPasswordMatch = await bcrypt.compare(password, user.password);
    if (!isPasswordMatch) {
      return res.status(401).json({ message: "Invalid credentials" });
    }

    // Generate JWT token
    const token = jwt.sign(
      { userId: user._id, name: user.name },
      process.env.JWT_SECRET,
      {
        expiresIn: "3d", // Token expiration time (e.g., 1 hour)
      }
    );
    res.cookie('token', token, {
      httpOnly: true, // Cookie is accessible only through HTTP requests
      maxAge: 1000 * 60 * 60 * 24 *3, // Expiry time in milliseconds (1 hour)
      secure: true, // Cookie is only sent over HTTPS
    });


    res.status(200).json({ token });
  } catch (error) {
    console.error("Login error:", error);
    res.status(500).json({ message: "Login failed" });
  }
};
// get current user

// Get user details for the currently logged-in user
export const getCurrentUserDetails = async (req, res) => {
  const {userId} = req.user;
  // console.log(userId)

  try {
    const user = await User.findById(userId);
    if (!user) {
      return res.status(404).json({ message: 'User not found' });
    }
    // Respond with user details
    res.status(200).json(user);
  } catch (error) {
    console.error('Error fetching user details:', error);
    res.status(500).json({ message: 'Failed to fetch user details' });
  }
};


// Update profile
export const updateProfile = async (req, res) => {
  const { userId } = req.user;
  const { name, username, password, department } = req.body;

  try {
    // Find the user by ID
    const user = await User.findById(userId);

    // If user not found, return 404 error
    if (!user) {
      return res.status(404).json({ message: "User not found" });
    }

    // Update user properties
    if (name) {
      user.name = name;
    }
    if (username) {
      user.username = username;
    }
    if (password) {
      // Hash the password before saving
      const salt = await bcrypt.genSalt(10);
      user.password = await bcrypt.hash(password, salt);
    }
    if (department) {
      user.department = department;
    }

    // Save the updated user object
    await user.save();

    // Respond with the updated user object
    res
      .status(200)
      .json({ message: "User profile updated successfully", user });
  } catch (error) {
    console.error("Error updating user profile:", error);
    res.status(500).json({ message: "Failed to update user profile" });
  }
};

// User logout
export const logout = (req, res) => {
  // Perform any necessary logout actions
  res.status(200).json({ message: "Logout successful" });
};
