import mongoose from "mongoose";
const CategorySchema = mongoose.Schema({
name:{
    type:String,
    required:true,
},

image:{
    type:String,
    required:true,
},
banner:{
    type:String,
    required:true,
},
});

export default mongoose.model("Category",CategorySchema); //Category is collection
