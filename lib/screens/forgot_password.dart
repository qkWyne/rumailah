import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rumailah/screens/login_otp.dart';
class ForgotPassword extends StatefulWidget {
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}
class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController _emailController = TextEditingController();
  GlobalKey<FormState> _Formkey = GlobalKey<FormState>();

  _resetPassword() async {
    try {
      FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text).then((
          value)=> {
        print("Sent Email"),
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>LoginOtp())),
      });
    } on FirebaseAuthException catch (e) {
      print("Error $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("Forgot Password", style: TextStyle(color: Color(0xFF6E7075)),
        ),
        ),
        body: Stack(
          children: [
            Positioned(
              top: 15,
              left: 210,
              child: Container(
                width: 250,
                height: 250,
                child: Image.asset("assets/images/forgotpassword/gray.png"),
              ),
            ),
            Center(
              child: Form(
                key: _Formkey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        child: Image.asset("assets/images/forgotpassword/forget.png"),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        child: Text("Reset Password",style: TextStyle(
                            color: Colors.black,
                            fontWeight:FontWeight.bold,
                            fontSize: 30),),
                      ),
                      SizedBox(height:40,),
                      Container(
                        alignment: Alignment(-0.8, 0),
                        child: Text("Email Address",
                          style: TextStyle(
                              color: Colors.grey.shade800,
                              fontWeight:FontWeight.bold,
                              fontSize: 16
                          ),),
                      ),
                      SizedBox(height: 5,),
                      Container(
                        width: 310,
                        child: TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                              label: Text("Email",style: TextStyle(color: Color(0xFF4D5E47)),),
                              labelStyle: TextStyle(color: Color(0xFF4D5E47)),
                              hintText: "Enter Email",
                              hintStyle: TextStyle(color: Color(0xFFB9B7B7)),
                              prefixIcon:  Icon(Icons.email_rounded,color: Color(0xFF4D5E47) ,),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 2,color: Color(0xFF4D5E47)),
                                borderRadius: BorderRadius.circular(8),

                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(width: 2,color:Color(0xFFC3BDBD))
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide()
                              )
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return "Email Required";
                            }
                            else if(!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{3}$"
                            ).hasMatch(value))
                            {
                              return "Please Valid Email";
                            }
                            return null;

                          },
                        ),
                      ),
                      SizedBox(height: 30,),
                      Container(
                        width: 310,
                        height: 55,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              backgroundColor: Color(0xFF4D5E47),
                              foregroundColor: Colors.white),
                          onPressed: () {
                            if(_Formkey.currentState!.validate()){
                              _resetPassword();
                            }
                          },
                          child: const Text(
                            "Send",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),




                    ],
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}