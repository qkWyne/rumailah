import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rumailah/screens/allow_location.dart';
import 'package:rumailah/screens/create_account.dart';
import 'package:rumailah/screens/forgot_password.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginOtp extends StatefulWidget {
  const LoginOtp({super.key});

  @override
  State<LoginOtp> createState() => _LoginOtpState();
}

class _LoginOtpState extends State<LoginOtp> {
  final Color greenColor =  Color(0xFF4D5E47);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool obscure = true;
  bool rememberMe = false;
  bool isLoading = false;


  @override
  void initState() {
    super.initState();
    loadUserLogin();
  }
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  void loadUserLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _emailController.text =  prefs.getString('email') ?? '';
      _passwordController.text = prefs.getString('password') ?? '';
      rememberMe = prefs.getBool('rememberMe') ?? false;
    });
  }


  Future<void> saveUserLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (rememberMe) {
      await prefs.setString('email', _emailController.text);
      await prefs.setString('password', _passwordController.text);
      await prefs.setBool('rememberMe', true);
    } else {
      await prefs.clear();
    }
  }


  void _login() async {

    setState(() {
      isLoading = true;
    });

    try {
      final UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );

      if (userCredential.user != null) {
        await saveUserLogin();
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => AllowLocation()),
          );
        }
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage = "Email and Password are incorrect.";

      if (e.code == 'user-not-found') {
        errorMessage = "No user found with this email.";
      } else if (e.code == 'too-many-requests') {
        errorMessage = "Too many failed attempts. Please try again later.";
      } else if (e.code == 'network-request-failed') {
        errorMessage = "Check your internet connection.";
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }



  void onCreatePressed() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 1));

    if (mounted) {
      setState(() {
        isLoading = false;
      });

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CreateAccount()),
      );
    }
  }





  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child:Stack(
        children: [
          Scaffold(
            backgroundColor: greenColor,
            body: Column(
              children: [
                Container(
                  height: 200,
                  child:
                  Center(child: Image.asset("assets/images/loginotp/logo.png")),
                ),
                Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                      child: SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Align(
                                alignment: Alignment(-0.7, 0),
                                child: Text(
                                  "Let's Get You Login",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: greenColor),
                                ),
                              ),
                              SizedBox(height: 10),
                              // Align(
                              //   alignment: Alignment(-0.5, 0),
                              //   child: Container(
                              //     child: RichText(
                              //         text: TextSpan(children: [
                              //       TextSpan(
                              //           text: "We will send you a",
                              //           style: TextStyle(
                              //               color: Color(0xFF9C9E9E), fontSize: 16)),
                              //       TextSpan(
                              //           text: "\nOne Time Password ",
                              //           style: TextStyle(
                              //               fontSize: 16,
                              //               fontWeight: FontWeight.bold,
                              //               color: Color(0xFFEF6010))),
                              //       TextSpan(
                              //           text: " to this Number",
                              //           style: TextStyle(
                              //               color: Color(0xFF9C9E9E), fontSize: 16)),
                              //     ])),
                              //   ),
                              // ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                width: 310,
                                child: TextFormField(
                                  cursorColor: greenColor,
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                      label: Text(
                                        "Email",
                                        style: TextStyle(color: greenColor),
                                      ),
                                      labelStyle: TextStyle(color: greenColor),
                                      hintText: "Enter Email",
                                      hintStyle: TextStyle(color: Color(0xFFB9B7B7)),
                                      prefixIcon: Icon(
                                        Icons.email_rounded,
                                        color: greenColor,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2, color: greenColor),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                              width: 2, color: Color(0xFFC3BDBD))),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8),
                                          borderSide: BorderSide())),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Email Required";
                                    } else if (!RegExp(
                                        r"^[\w-\.]+@([\w-]+\.)+[\w-]{3}$")
                                        .hasMatch(value)) {
                                      return "Please Valid Email";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: 310,
                                child: TextFormField(
                                  cursorColor: greenColor,
                                  controller: _passwordController,
                                  obscureText: obscure,
                                  decoration: InputDecoration(
                                      label: Text(
                                        "Password",
                                        style: TextStyle(color: greenColor),
                                      ),
                                      labelStyle: TextStyle(color: greenColor),
                                      hintText: "Enter Password",
                                      hintStyle: TextStyle(color: Color(0xFFB9B7B7)),
                                      prefixIcon: Icon(
                                        Icons.password_rounded,
                                        color: greenColor,
                                      ),
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              obscure = !obscure;
                                            });
                                          },
                                          icon: Icon(
                                            obscure
                                                ? Icons.visibility_off_outlined
                                                : Icons.visibility_outlined,
                                            color: greenColor,
                                          )),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2, color: greenColor),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                              width: 2, color: Color(0xFFC3BDBD))),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8),
                                          borderSide: BorderSide())),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Password Required";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              // Container(
                              //   width: 330,
                              //   child: IntlPhoneField(
                              //     showCountryFlag: false,
                              //     cursorColor: Color(0xFF535557),
                              //     controller: phoneNoController,
                              //     style:
                              //         TextStyle(color: Color(0xFF535557), fontSize: 18),
                              //     flagsButtonPadding: const EdgeInsets.all(10),
                              //     dropdownIconPosition: IconPosition.trailing,
                              //     decoration: const InputDecoration(
                              //       hintText: "Enter Phone Number",
                              //       hintStyle: TextStyle(color: Color(0xFF535557)),
                              //       focusedBorder: OutlineInputBorder(
                              //         borderSide:
                              //             BorderSide(width: 2, color: Color(0xFF4D5E47)),
                              //       ),
                              //       border: OutlineInputBorder(
                              //           borderSide: BorderSide(color: Color(0xFF4D5E47))),
                              //       contentPadding: EdgeInsets.symmetric(vertical: 20),
                              //     ),
                              //     dropdownTextStyle:
                              //         TextStyle(color: Color(0xFF4D5E47), fontSize: 16),
                              //     dropdownIcon: Icon(Icons.arrow_drop_down,
                              //         color: Color(0xFF4D5E47)),
                              //     initialCountryCode: 'PK',
                              //     onChanged: (phone) {
                              //       setState(() {
                              //         isValid = false;
                              //         fullPhoneNumber = phone.completeNumber;
                              //         isValid = phone.isValidNumber();
                              //       });
                              //     },
                              //   ),
                              // ),
                              SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      child: Container(
                                        child: Text(
                                          "Forgot Password?",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.black45,
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ForgotPassword()));
                                      },
                                    ),
                                    Row(
                                      children: [
                                        Checkbox(
                                          value: rememberMe,
                                          activeColor: greenColor,
                                          onChanged: (value) {
                                            setState(() {
                                              rememberMe = value!;
                                            });
                                          },
                                        ),
                                        Text("Remember Me",style: TextStyle(
                                            color: rememberMe ? greenColor:Colors.black,
                                          fontWeight: rememberMe ? FontWeight.bold : FontWeight.normal
                                        ),),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              // Container(
                              //   child: RichText(
                              //       text: TextSpan(children: [
                              //     TextSpan(
                              //         text: "By continuing. you agree to our ",
                              //         style: TextStyle(color: Color(0xFF9C9E9E))),
                              //     TextSpan(
                              //         text: "Refund, Terms & Polices",
                              //         style: TextStyle(
                              //             fontSize: 12,
                              //             fontWeight: FontWeight.bold,
                              //             color: Color(0xFF4D5E47))),
                              //   ])),
                              // ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: 330,
                                height: 55,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                      backgroundColor: greenColor,
                                      foregroundColor: Colors.white),
                                  onPressed:() {
                                    if (_formKey.currentState!.validate()) {
                                      _login();
                                    }
                                  },
                                  child:Text("Login", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Don’t have account ?",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    InkWell(
                                        onTap:() {
                                          onCreatePressed();
                                        },
                                        child: Text(
                                          "Create",
                                          style: TextStyle(
                                              color: Color(0xFFEF6010),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ),
    if (isLoading)
    Positioned.fill(
    child: Container(
    color: Colors.black.withOpacity(0.5),
    child: Center(
    child: Container(
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),),
        child: CircularProgressIndicator(color: Colors.blue)),
    ),),),
        ],
      ),
    );
  }
}
