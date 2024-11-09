import express from "express";
import ProductReview from "../model/product_review.js";


const productReviewRouter = express.Router();
productReviewRouter.post('/api/product-review',async(req,res)=>{
 try {
    const {buyerId,email,fullName,productId,rating,review} = req.body;
    const reviews = new ProductReview({buyerId,email,fullName,productId,rating,review});
    await reviews.save();

    return res.status(201).send(reviews);
 } catch (e) {
    res.status(500).json({"error":e.message})
    
 }
});


productReviewRouter.get('/api/reviews',async(req,res)=>{
   try {

     const review= await ProductReview.find();
  
      return res.status(200).json(review);
   } catch (e) {
      res.status(500).json({"error":e.message})
      
   }
  });

export default productReviewRouter;