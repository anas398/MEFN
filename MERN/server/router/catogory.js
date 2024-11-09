import express from "express";
import Category from "../model/categorymodel.js"

const categoryRouter = express.Router();
categoryRouter.post('/api/categories',async(req,res)=>{
   try{
    const {image,banner,name} = req.body;
    const category =  new Category({image,banner,name});
    await category.save() ;
    res.status(201).send(category);
}catch(e){
    res.status(500).json({
        error:e.message
    });
   }

});

categoryRouter.get('/api/getCategories',async (req,res)=>{
    try {
       const category = await Category.find();
        if(!category || category.length==0){
            return res.status(404).json({messgae:"category not found"});

        }
        return res.status(200).json(category);
    } catch (e) {
        res.status(500).json({error:e.message});
        
    }
});





export default categoryRouter;