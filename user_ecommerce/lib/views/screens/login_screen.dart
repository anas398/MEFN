import 'package:flutter/material.dart';
import 'package:udemy_ecommerce/controller/auth_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final AuthController _authController =AuthController();
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  bool isLoading = false;
  loginUser()async{
   setState(() {
     isLoading=true;
   });
      if(_formkey.currentState!.validate()){
        await _authController.
        signInUsers(context: context,
            email: txtemail.text, password: txtPassword.text).whenComplete((){
           setState(() {
             isLoading= false;
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
        title: const Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

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
                TextButton(

                    onPressed:loginUser,

                    child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: isLoading?CircularProgressIndicator():
                        Text("SignIn",
                          style: TextStyle(
                              color: Colors.white
                          ),)))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
