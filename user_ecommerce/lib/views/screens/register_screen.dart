import 'package:flutter/material.dart';
import 'package:udemy_ecommerce/controller/auth_controller.dart';
import 'package:udemy_ecommerce/views/screens/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final AuthController _authController =AuthController();
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtName = TextEditingController();
  TextEditingController txtAddress = TextEditingController();
  bool isLoding = false;
 void registerUser()async{
    setState(() {
      isLoding =true;
    });
      if(_formkey.currentState!.validate()){
        await _authController.signUpUsers(context: context, email: txtemail.text,
            address: txtAddress.text,
            name: txtName.text, password: txtPassword.text).whenComplete((){
             _formkey.currentState!.reset();
              setState(() {
                isLoding=false;
              });
        });
      }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      resizeToAvoidBottomInset: false,
      extendBody: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("SignUp"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(

                    controller:txtName ,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Enter Your  Name';
                      }else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        labelText: "Name",
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 3,

                            ),
                            borderRadius: BorderRadius.circular(30)
                        )
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller:txtAddress ,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Enter Your  Address';
                      }else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        labelText: "Address",
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 3,

                            ),
                            borderRadius: BorderRadius.circular(30)
                        )
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller:txtemail ,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Enter Your Email';
                      }else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 3,

                            ),
                            borderRadius: BorderRadius.circular(30)
                        )
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller:txtPassword ,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Enter Your Password';
                      }else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 3,

                            ),
                            borderRadius: BorderRadius.circular(30)
                        )
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextButton(onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>const LoginScreen()));
                  }, child: Text("Already register ? SignIn")),
                  const SizedBox(height: 20,),
                  TextButton(

                      onPressed:registerUser,

                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: isLoding ? CircularProgressIndicator(): Text("SignUp",
                          style: TextStyle(
                            color: Colors.white
                          ),)))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
