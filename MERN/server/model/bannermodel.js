import mongoose from "mongoose"
const bannerSchema = mongoose.Schema({
   image:{
       type:String,
       required:true,
   }

});
export default mongoose.model("Banner",bannerSchema); //Banner is collection
