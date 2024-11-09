import mongoose from "mongoose";

const productSchema = mongoose.Schema(
    {
        productName:{
            type:String,
            trime:true,
            required:true
        },
        productPrice:{
            type:Number,
          
            required:true
        },
        quantity:{
            type:Number,
            required:true
        },
        description:{
            type:String,
            required:true
        },
        category:{
            type:String,
            required:true
        },
        subCategory:{
            type:String,
            required:true
        },
        images:[  //LIST [] bcos we have to add many images so that we need list
            {
                type:String,
                required:true
            },
        ],
        popular:{
            type:Boolean,
            default:false
        },
        recommend:{
            type:Boolean,
            default:true
        },
    });
    export default mongoose.model("Products",productSchema);