import dbConnect from './config/dbConnect.js';
import bcrypt from 'bcryptjs';
import Post from './models/Post.js';
import User from './models/User.js';
import Comment from './models/Comment.js';

// Connect to the database
dbConnect();

// Function to clear existing data and insert sample data
async function importData() {
  try {
    await User.deleteMany({});
    await Post.deleteMany({});
    await Comment.deleteMany({});

    const hashedPassword = await bcrypt.hash('admin', 10);

    const users = [
      {
        name: "Tamirat Kebede",
        email: "tamirat@gmail.com",
        password: hashedPassword,
        profile_picture: "https://example.com/profiles/alice.jpg",
        bio: "Enthusiastic learner",
        department: "Computer Science",
        username: "tamirat",
        gender: "Male",
        is_teacher: false,
        is_verified: true
      },
      {
        name: "Sura",
        email: "sura@gmail.com",
        password: hashedPassword,
        profile_picture: "https://example.com/profiles/bob.jpg",
        bio: "Tech enthusiast",
        department: "Information Technology",
        username: "sura_t",
        gender: "Male",
        is_teacher: false,
        is_verified: true
      },
      {
        name: "Yoseph",
        email: "yoseph@gmail.com",
        password: hashedPassword,
        profile_picture: "https://example.com/profiles/charlie.jpg",
        bio: "Love coding",
        department: "Software Engineering",
        username: "yoseph",
        gender: "Male",
        is_teacher: false,
        is_verified: true
      },
      {
        name: "Admin",
        email: "admin@gmail.com",
        password: hashedPassword,
        profile_picture: "https://example.com/profiles/charlie.jpg",
        bio: "Love coding",
        department: "Software Engineering",
        username: "admin",
        gender: "Male",
        is_teacher: false,
        is_verified: true
      }
    ];

    const createdUsers = await User.insertMany(users);

    const posts = [
      {
        creator: createdUsers[0]._id,
        content: "What's the best way to learn Python?",
        upvotes: 10,
        downvotes: 2,
        isLiked: true,
        isDisliked: false,
        comments: [] // Initialize comments array
      },
      {
        creator: createdUsers[1]._id,
        content: "Can anyone recommend good resources for learning React?",
        upvotes: 15,
        downvotes: 1,
        isLiked: true,
        isDisliked: false,
        comments: [] // Initialize comments array
      },
      {
        creator: createdUsers[2]._id,
        content: "What's the difference between frontend and backend development?",
        upvotes: 8,
        downvotes: 0,
        isLiked: true,
        isDisliked: false,
        comments: [] // Initialize comments array
      }
    ];

    const createdPosts = await Post.insertMany(posts);

    const comments = [
      {
        user: createdUsers[1]._id,
        content: "You can start with Codecademy's Python course.",
        upvote: 5,
        downvote: 0,
        reply: "",
        postId: createdPosts[0]._id
      },
      {
        user: createdUsers[2]._id,
        content: "Check out freeCodeCamp and its React tutorials.",
        upvote: 8,
        downvote: 1,
        reply: "",
        postId: createdPosts[1]._id
      },
      {
        user: createdUsers[0]._id,
        content: "Frontend focuses on user interfaces, while backend deals with server-side logic.",
        upvote: 10,
        downvote: 0,
        reply: "",
        postId: createdPosts[2]._id
      }
    ];

    // Insert comments and link them to their respective posts
    const createdComments = await Comment.insertMany(comments);

    // Update posts with comments references
    createdPosts.forEach((post, index) => {
      post.comments.push(createdComments[index]._id); // Assuming comments are added in order
    });

    await Promise.all(createdPosts.map(post => post.save()));

    console.log('Data Imported!');
    process.exit();
  } catch (error) {
    console.error(`Error with data import: ${error}`);
    process.exit(1);
  }
}

// Function to clear existing data
async function destroyData() {
  try {
    await User.deleteMany({});
    await Post.deleteMany({});
    await Comment.deleteMany({});

    console.log('Data Destroyed!');
    process.exit();
  } catch (error) {
    console.error(`Error with data destroy: ${error}`);
    process.exit(1);
  }
}

// Determine whether to import or destroy data based on command line argument
if (process.argv[2] === '--import') {
  importData();
} else if (process.argv[2] === '--destroy') {
  destroyData();
}
