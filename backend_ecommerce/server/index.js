import mongoose from "mongoose";
import express from "express"
import bodyParser from "body-parser";
import dotenv from "dotenv"
import authRouter from "../server/router/auth.js";
import bannerRouter from "./router/banner.js";
import categoryRouter from "./router/catogory.js";
import subCategoryRouter from "../server/router/sub_category.js";
import productRouter from "../server/router/product.js";
import productReviewRouter from "../server/router/review.js";
import cors from "cors"; //CROSS ORIGIN RESOURCE SHARING(Enable Cors for all routes and origin(Domain))
const app = express();
app.use(bodyParser.json());
app.use(express.json());//automatically json data send by http request
app.use(cors()); //enable cors for all routes and origin
app.use(authRouter);
app.use(bannerRouter);
app.use(productRouter);
app.use(categoryRouter);
app.use(subCategoryRouter);
app.use(productReviewRouter);
dotenv.config();

const PORT = process.env.PORT|| 3000 ;
const MONGOURL = process.env.MONGO_URL;

mongoose.connect(MONGOURL).then(()=>{
    console.log("DB Connected Sucessfully.....");
    app.listen(PORT,() => {
    console.log(`Server Consnected On PORT :: ${PORT}`);

    })
}).catch((error)=> console.log(error));



