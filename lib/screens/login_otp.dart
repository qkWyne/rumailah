import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:rumailah/screens/allow_location.dart';
import 'package:rumailah/screens/create_account.dart';
import 'package:rumailah/screens/forgot_password.dart';
import 'package:rumailah/screens/home.dart';
import 'package:rumailah/screens/otp_verify.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginOtp extends StatefulWidget {
  const LoginOtp({super.key});

  @override
  State<LoginOtp> createState() => _LoginOtpState();
}

class _LoginOtpState extends State<LoginOtp> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> _FormKey = GlobalKey<FormState>();
  String fullPhoneNumber = "";
  bool isValid = false;
  bool obscure = true;
  bool rememberMe = false;

  @override
  void initState() {
    super.initState();
    loadUserLogin();
  }


  void loadUserLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _emailController.text = prefs.getString('email') ?? '';
      _passwordController.text = prefs.getString('password') ?? '';
      rememberMe = prefs.getBool('rememberMe') ?? false;
    });
  }


  void saveUserLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (rememberMe) {
      await prefs.setString('email', _emailController.text);
      await prefs.setString('password', _passwordController.text);
      await prefs.setBool('rememberMe', true);
    } else {
      await prefs.remove('email');
      await prefs.remove('password');
      await prefs.setBool('rememberMe', false);
    }
  }

  _login() async {
    try {
      final User? firebaseUser = (await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: _emailController.text,
                  password: _passwordController.text))
          .user;
      if (firebaseUser != null) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AllowLocation()));
        saveUserLogin();
      }
    } on FirebaseAuthException catch (e) {
      print("Error $e");
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("No user found with this email.")),
        );
      } else {
        // Other errors
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              duration: Duration(seconds: 3),
              content:
                  Text("Email and Password are Incorrect. Please try again.")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Color(0xFF4D5E47),
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
                  key: _FormKey,
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
                              color: Color(0xFF4D5E47)),
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
                          controller: _emailController,
                          decoration: InputDecoration(
                              label: Text(
                                "Email",
                                style: TextStyle(color: Color(0xFF4D5E47)),
                              ),
                              labelStyle: TextStyle(color: Color(0xFF4D5E47)),
                              hintText: "Enter Email",
                              hintStyle: TextStyle(color: Color(0xFFB9B7B7)),
                              prefixIcon: Icon(
                                Icons.email_rounded,
                                color: Color(0xFF4D5E47),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: Color(0xFF4D5E47)),
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
                          controller: _passwordController,
                          obscureText: obscure,
                          decoration: InputDecoration(
                              label: Text(
                                "Password",
                                style: TextStyle(color: Color(0xFF4D5E47)),
                              ),
                              labelStyle: TextStyle(color: Color(0xFF4D5E47)),
                              hintText: "Enter Password",
                              hintStyle: TextStyle(color: Color(0xFFB9B7B7)),
                              prefixIcon: Icon(
                                Icons.password_rounded,
                                color: Color(0xFF4D5E47),
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
                                    color: Colors.grey.shade800,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: Color(0xFF4D5E47)),
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                  activeColor: Color(0xFF4D5E47),
                                  onChanged: (value) {
                                    setState(() {
                                      rememberMe = value!;
                                    });
                                  },
                                ),
                                Text("Remember Me"),
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
                              backgroundColor: Color(0xFF4D5E47),
                              foregroundColor: Colors.white),
                          onPressed: () {
                            if (_FormKey.currentState!.validate()) {
                              _login();
                            }
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
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
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CreateAccount()));
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
    );
  }
}
