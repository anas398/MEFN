import express from "express";
import Banner from "../model/bannermodel.js"
const bannerRouter = express.Router();


bannerRouter.post('/api/banner',async (req,res)=>{
   try{
    const {image} = req.body; //send from client
    const banner= new Banner({image}); //save to localy
    await banner.save(); //save in mongoDb
    return res.status(201).send(banner);


   }catch(e){
    res.status(400).json({
        error:e.message
    });

   }

});

//Get Banner

bannerRouter.get('/api/getbanners',async(req,res)=>{
   try{
    const banners=await Banner.find() //we get all the banner
     return res.status(200).send(banners);
   }catch(e){
    res.status(400).json({
        error:e.message
    });
   }

})
export default bannerRouter;