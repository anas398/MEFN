import SubCategory from "../model/sub_category.js";
import express from "express"

const subCategoryRouter = express.Router();
subCategoryRouter.post('/api/subCategories',async (req,res)=>{
    try {
        const {categoryId,categoryName,image,subCategoryName} = req.body;
        const subcategory=   new SubCategory({categoryId,categoryName,image,subCategoryName});
        await subcategory.save() ;
        res.status(201).send(subcategory);
    } catch (e) {
        res.status(500).json({
            error:e.message
        });
    }
});
//===========================//IMPORTANT=========================
//get subcategory based on Category (:  used for parameeter)
subCategoryRouter.get('/api/category/:categoryName/subcategories',async(req,res)=>{
  try {
       //extract categoryName from request url using  Destructuring
   const {categoryName} = req.params;

   const subcategories = await SubCategory.find({categoryName:categoryName});
   //Check if any subcategories were found
   if(!subcategories || subcategories.length==0){
    return res.status(404).json({message:"Subcategories Not Found"});

   }else{
    return res.status(200).json({subcategories});
   }
  } catch (e) {
    res.status(500).json({error:e.message})
  }

}) ;
//All category
subCategoryRouter.get('/api/getSubCategory',async(req,res)=>{
    try{
     const subCat=await SubCategory.find() //we get all the banner
      return res.status(200).send(subCat);
    }catch(e){
     res.status(400).json({
         error:e.message
     });
    }
 
 })


export default subCategoryRouter;