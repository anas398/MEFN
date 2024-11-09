import express from "express";
import bcrypt from "bcryptjs";
import jwt from "jsonwebtoken";
import User from "../model/usermodel.js";

const authRouter = express.Router(); //initilise router

//Signup...................
authRouter.post("/api/signup",async(req,res)=>{
   try{
    const {name,password,address,email} = req.body;
    const userExist = await User.findOne({email})
    if(userExist){
        return  res.status(400).json({message:"User Already Exist"});
    }else{
        //Generate a salt with cost factor of 10
        const salt = await bcrypt.genSalt(10);
        //hash the password using generated salt
        const hashedPassword = await bcrypt.hash(password,salt);
      
        let user=new User({name,password:hashedPassword,address,email});
        console.log(`USER>>>> ${user}`);
        user= await user.save();
        res.status(200).json(user);   
    }
   

   }catch(e){
    res.status(500).json({error:e.message})

   }
});
//SignIn...................
authRouter.post("/api/signin",async(req,res)=>{
    try{  
        const {password,email} = req.body;
        const findUser = await User.findOne({email});//ALL THE VALUE STORED IN findUser VARIABLE
        console.log(`find user>>> ${findUser}`);

        if(!findUser){
            return  res.status(400).json({message:"User Not Found with this mail.."});
        }else{
           const isMatch = await bcrypt.compare(password,findUser.password);
        if(!isMatch){
            return res.status(400).json({message:"Incorrect Password"})
        }
        else{

            const token =jwt.sign({id:findUser._id},"passwordkey");

            console.log(`"ddddata  ::>> ${findUser._doc}`);
            //remove sensitive information or extract the password
            const {password ,...userWithoutPasswprd } = findUser._doc;
             //send the response
                 
            res.json({token,...userWithoutPasswprd});
                
           }
     
        }
    }catch(e){
        
        res.status(500).json({error:e.message})
    }

 });
 
export default authRouter;