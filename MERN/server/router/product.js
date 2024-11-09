import express from "express";
import Products from "../model/product.js";

const productRouter = express.Router();
productRouter.post('/api/add-product',async (req,res)=>{
    try {
        const {productName,productPrice,quantity,description,category,subCategory,images} = req.body;
        const product= new Products({productName,productPrice,quantity,description,category,subCategory,images});
        await product.save();
        return res.status(201).send(product);
    } catch (e) {
        res.status(500).json({error:e.message});
        
    }
});


productRouter.get('/api/popular-product',async (req,res)=>{
    try {
       const product = await Products.find({popular:true});
        if(!product || product.length==0){
            return res.status(404).json({messgae:"Product not found"});

        }
        return res.status(201).send({product});
    } catch (e) {
        res.status(500).json({error:e.message});
        
    }
});

productRouter.get('/api/recommend-product',async (req,res)=>{
    try {
       const product = await Products.find({recommend:true});
        if(!product || product.length==0){
            return res.status(404).json({messgae:"Product not found"});

        }
        return res.status(201).send(product);
    } catch (e) {
        res.status(500).json({error:e.message});
        
    }
});



export default productRouter;
