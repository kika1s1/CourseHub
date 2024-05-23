import mongoose from 'mongoose';
import bcrypt from 'bcryptjs';

const userSchema = new mongoose.Schema({
    username: { 
        type: String,
         required: true,
          unique: true 
        },
    fullname: { 
        type: String, 
        required: true 
    },
    age: { type: Number,
         required: true 
        },
    department: { 
        type: String, 
        required: true 
    },
    isStudent: { 
        type: Boolean, 
        default: true 
    },
    email: { 
        type: String, 
        required: true, 
        unique: true 
    },
    password: { type: 
        String, required: true
     },
    image: { 
        type: String 

    }
});

// Password hashing middleware
userSchema.pre('save', async function(next) {
    if (!this.isModified('password')) return next();
    const salt = await bcrypt.genSalt(10);
    this.password =  bcrypt.hash(this.password, salt);
    next();
});

const User = mongoose.model('User', userSchema);

export default User;
