import Post from "../models/Post.js";
import Comment from "../models/Comment.js";
import User from "../models/User.js";

export const getAllPosts = async (req, res) => {
  try {
    const posts = await Post.find()
      .populate('creator', 'username')
      .populate({
        path: 'comments',
        populate: { path: 'user', select: 'username' }
      });
    res.json(posts);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

export const createPost = async (req, res) => {
  const { content } = req.body; // Assuming "content" is passed in req.body

  try {
    // Retrieve the logged-in user
    const user = await User.findById(req.user.userId); // Assuming req.user.userId contains the logged-in user's ID
    if (!user) {
      return res.status(404).json({ message: "User not found" });
    }

    // Create a new Post instance
    const newPost = new Post({
      creator: user._id, // Set the creator field to the logged-in user's ID
      content: content,
    });

    // Save the new post to the database
    const savedPost = await newPost.save();

    // Populate the 'creator' field with '_id' and 'username' from User model
    await savedPost.populate({ path: 'creator', select: '_id username' });

    // Return the newly created post with populated creator field
    res.status(201).json(savedPost);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
};
export const updateUpvote = async (req, res) => {
  try {
    const post = await Post.findById(req.params.id);
    if (!post) {
      return res.status(404).json({ message: "Post not found" });
    }

    if (req.body.isLiked !== undefined) post.isLiked = req.body.isLiked;
    if (req.body.isDisliked !== undefined) post.isDisliked = req.body.isDisliked;
    if (req.body.upvotes !== undefined) post.upvotes = req.body.upvotes;
    if (req.body.downvotes !== undefined) post.downvotes = req.body.downvotes;

    await post.save();
    res.json(post);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
};

export const likePost = async (req, res) => {
  const postId = req.params.postId;
  const { user } = req.body; // Assuming "user" is passed in req.body

  try {
    const post = await Post.findById(postId);

    if (!post) {
      return res.status(404).json({ message: 'Post not found' });
    }

    // Check if the user has already liked the post
    if (post.likes.includes(user)) {
      return res.status(400).json({ message: 'You have already liked this post' });
    }

    post.likes.push(user);
    await post.save();

    res.status(200).json({ message: 'Post liked successfully' });
  } catch (error) {
    console.error(error.message);
    res.status(500).send('Server error');
  }
};
