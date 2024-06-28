
import Post from "../models/Post.js";
import Comment from "../models/Comment.js";
import User from "../models/User.js";
export const addCommentToPost = async (req, res) => {
  const postId = req.params.postId
  // console.log(postId)
  const { content } = req.body;

  try {
    // Retrieve userId from req.user
    const userId = req.user.userId;

    // Check if the post exists
    const post = await Post.findById(postId);
    if (!post) {
      return res.status(404).json({ message: "Post not found" });
    }

    // Find the user based on userId
    const existingUser = await User.findById(userId);
    if (!existingUser) {
      return res.status(404).json({ message: "User not found" });
    }

    // Create a new comment
    const comment = new Comment({
      user: existingUser, // Assign the user's ID to the comment
      content: content,
      postId:postId
    });

    // Save the new comment to the database
    const newComment = await comment.save();

    // Add the new comment to the post's comments array
    post.comments.push(newComment);
    await post.save();

    // Return the newly created comment as response
    res.status(201).json(newComment);
  } catch (err) {
    console.log(err.message)
    res.status(400).json({ message: err.message });
  }
};