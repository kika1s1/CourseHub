import express from 'express'
import cors from 'cors'
import bodyParser from 'body-parser'
import dotenv from 'dotenv'

// user created 
import dbConnect from './config/dbConnect.js'
import authRoute from './routes/authRoutes.js'
import userRoute from './routes/userRoutes.js'
import commnetRoute from './routes/commentRoute.js'
import postRoute from './routes/postRoute.js'
dotenv.config({})
const app = express()
const PORT = process.env.PORT
dbConnect();
app.use(bodyParser.json());
app.use(cors());
const postsData = [
  {
    "username": "user1",
    "content": "This is a post",
    "upvotes": 10,
    "downvotes": 2
  },
  {
    "username": "user2",
    "content": "Another post",
    "upvotes": 5,
    "downvotes": 1
  }
]

app.get('/posts', (req, res) => {
    
  
    res.json(postsData);
  });
// middleware
app.use("/api/users", authRoute)
app.use("/api/users", userRoute)
app.use("/api/posts", postRoute)
app.use("/api/comments", commnetRoute)

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});