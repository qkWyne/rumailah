import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rumailah/screens/allow_location.dart';
class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController _firstnameController = TextEditingController();
  TextEditingController _lastnameController = TextEditingController();
  TextEditingController _phoneNoController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmpasswordController = TextEditingController();
  TextEditingController _datePickerController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool obscure1 = true;
  bool obscure2 = true;
  String? selectedGender;
  bool isLoading = false;
  final List<Map<String, dynamic>> genderOptions = [
    {'value': 'male', 'label': 'Male',},
    {'value': 'female', 'label': 'Female', },
    {'value': 'other', 'label': 'Other',},
  ];

  _signup() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      isLoading = true;
    });

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      log("User Created");
      String uid = FirebaseAuth.instance.currentUser!.uid;
      await FirebaseFirestore.instance.collection("users").doc(uid).set({
        "userID":uid,
        "userCreate_At":DateTime.now(),
        "firstName":_firstnameController.text,
        "lastName":_lastnameController.text,
        "userEmail":_emailController.text,
        "userPhoneNo":_phoneNoController.text,
        "userGender":selectedGender,
        "userDOB":_datePickerController.text,
      });
      log("User Data Saved");
      if(mounted){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AllowLocation()));
      }

    } on FirebaseAuthException catch (e) {
      print("Error $e");
      if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              duration: Duration(seconds: 2),
              content: Text("This email is already exist")),
        );
      }
    }finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>FocusScope.of(context).unfocus(),
      child: Stack(
        children: [
          Scaffold(
            body: Stack(
              children: [
                Positioned(
                  top: 15,
                  left: 210,
                  child: Container(
                    width: 250,
                    height: 250,
                    child: Image.asset("assets/images/createaccount/gray.png"),
                  ),
                ),
                Form(
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            SizedBox(height: 50,),
                            Container(
                              alignment: Alignment(-0.7, 0),
                              child: Text("Create Account",style: TextStyle(
                                  color: Color(0xFF4D5E47),
                                  fontWeight:FontWeight.bold,
                                  fontSize: 25),),
                            ),

                            SizedBox(height: 5,),
                            Container(
                              alignment: Alignment(-0.7, 0),
                              child: Text("Enter Basic info",
                                style: TextStyle(color: Color(0xFF9C9E9E),fontSize: 18),),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              alignment: Alignment(-0.8, 0),
                              child: Text("First Name",
                                style: TextStyle(
                                    color: Color(0xFF2D2727),
                                    fontWeight:FontWeight.bold,
                                    fontSize: 16
                                ),),
                            ),
                            SizedBox(height: 5,),
                            Container(
                              width: 310,
                              child: TextFormField(
                                textCapitalization: TextCapitalization.sentences,
                                controller: _firstnameController,
                                decoration: InputDecoration(
                                    hintText: "Enter First Name",
                                    hintStyle: TextStyle(color: Color(0xFFB9B7B7)),
                                    prefixIcon: Image.asset("assets/images/createaccount/user.png",),
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
                                    return "Required";
                                  }
                                  else if(!RegExp(r"^[a-zA-Z0-9_]+$"
                                  ).hasMatch(value))
                                  {
                                    return "Please Valid Name";
                                  }
                                  return null;

                                },
                              ),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              alignment: Alignment(-0.8, 0),
                              child: Text("Last Name",
                                style: TextStyle(
                                    color: Color(0xFF2D2727),
                                    fontWeight:FontWeight.bold,
                                    fontSize: 16
                                ),),
                            ),
                            SizedBox(height: 5,),
                            Container(
                              width: 310,
                              child: TextFormField(
                                textCapitalization: TextCapitalization.sentences,
                                controller: _lastnameController,
                                decoration: InputDecoration(
                                    hintText: "Enter Last Name",
                                    hintStyle: TextStyle(color: Color(0xFFB9B7B7)),
                                    prefixIcon: Image.asset("assets/images/createaccount/user.png",),
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
                                    return "Required";
                                  }
                                  else if(!RegExp(r"^[a-zA-Z0-9_]+$"
                                  ).hasMatch(value))
                                  {
                                    return "Please Valid Name";
                                  }
                                  return null;

                                },
                              ),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              alignment: Alignment(-0.8, 0),
                              child: Text("Mobile",
                                style: TextStyle(
                                    color: Color(0xFF2D2727),
                                    fontWeight:FontWeight.bold,
                                    fontSize: 16
                                ),),
                            ),
                            SizedBox(height: 5,),
                            Container(
                              width: 310,
                              child: TextFormField(
                                keyboardType: TextInputType.phone,
                                controller: _phoneNoController,
                                decoration: InputDecoration(
                                  hintText: "+92301 1111111",
                                  hintStyle: TextStyle(color: Color(0xFFB9B7B7)),
                                  prefixIcon: Image.asset("assets/images/createaccount/Mobile.png",height:58,),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 2,color: Color(0xFF4D5E47)),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(width: 2,color:Color(0xFFC3BDBD),),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide()
                                  ),
                                ),
                                validator: (value){
                                  if(value!.isEmpty){
                                    return "Required";
                                  }
                                  else if(!RegExp(r"^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$"
                                  ).hasMatch(value))
                                  {
                                    return "Please Valid Phone No";
                                  }
                                  return null;

                                },
                              ),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              alignment: Alignment(-0.8, 0),
                              child: Text("Email",
                                style: TextStyle(
                                    color: Color(0xFF2D2727),
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
                                    hintText: "Enter Email",
                                    hintStyle: TextStyle(color: Color(0xFFB9B7B7)),
                                    prefixIcon: Image.asset("assets/images/createaccount/Email.png",),
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

                            SizedBox(height: 20,),
                            Container(
                              alignment: Alignment(-0.8, 0),
                              child: Text("Password",
                                style: TextStyle(
                                    color: Color(0xFF2D2727),
                                    fontWeight:FontWeight.bold,
                                    fontSize: 16
                                ),),
                            ),
                            SizedBox(height: 5,),
                            Container(
                              width: 310,
                              child: TextFormField(
                                controller: _passwordController,
                                obscureText: obscure1,
                                decoration: InputDecoration(
                                  hintText: "Enter Password",
                                  hintStyle: TextStyle(color: Color(0xFFB9B7B7)),
                                  prefixIcon: Icon(Icons.password,color: Colors.grey[400],),
                                  suffixIcon: IconButton(onPressed: (){
                                    setState(() {
                                      obscure1 = !obscure1;
                                    });
                                  }, icon: Icon(obscure1 ? Icons.visibility_off_outlined : Icons.visibility_outlined,color: Colors.grey.shade800,)),
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
                                  ),
                                ),
                                validator: (value) {
                                  if (value== null || value.isEmpty) {
                                    return "Password Required";
                                  }
                                  else if (!RegExp(r"(?=.*[A-Z])").hasMatch(value)) {
                                    return "A Upper Case";
                                  }
                                  else if (!RegExp(r"(?=.*[a-z])").hasMatch(value)) {
                                    return "A Lower Case";
                                  }
                                  else if (!RegExp(r"(?=.*\W)(?!.* )").hasMatch(value)) {
                                    return "A Special Character";
                                  }
                                  else if (!RegExp(r"(?=.*[0-9])").hasMatch(value)) {
                                    return "A Number";
                                  }
                                  else if (value.length < 8 || value.length > 16) {
                                    return "A Minimum 8 Character";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              alignment: Alignment(-0.8, 0),
                              child: Text("Confirm Password",
                                style: TextStyle(
                                    color: Color(0xFF2D2727),
                                    fontWeight:FontWeight.bold,
                                    fontSize: 16
                                ),),
                            ),
                            SizedBox(height: 5,),
                            Container(
                              width: 310,
                              child: TextFormField(
                                controller: _confirmpasswordController,
                                obscureText: obscure2,
                                decoration: InputDecoration(
                                    hintText: "Enter Confirm Password",
                                    hintStyle: TextStyle(color: Color(0xFFB9B7B7)),
                                    prefixIcon: Icon(Icons.password,color: Colors.grey[400],),
                                    suffixIcon: IconButton(onPressed: (){
                                      setState(() {
                                        obscure2 = !obscure2;
                                      });
                                    }, icon: Icon(obscure2 ? Icons.visibility_off_outlined : Icons.visibility_outlined,color: Colors.grey.shade800,)),
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
                                    return "Required";
                                  }
                                  else if(value!=_passwordController.text)
                                  {
                                    return "Password Not Match";
                                  }
                                  return null;

                                },
                              ),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              alignment: Alignment(-0.8, 0),
                              child: Text("Select Gender",
                                style: TextStyle(
                                    color: Color(0xFF2D2727),
                                    fontWeight:FontWeight.bold,
                                    fontSize: 16
                                ),),
                            ),
                            SizedBox(height: 5,),
                            Container(
                                width: 310,
                                child: DropdownButtonFormField<String>(
                                  value: selectedGender,
                                  onChanged: (String? newValue){
                                    setState(() {
                                      selectedGender = newValue;
                                    });
                                  },
                                  decoration: InputDecoration(
                                      hintText: "Gender",
                                      hintStyle: TextStyle(color: Color(0xFFB9B7B7)),
                                      prefixIcon: Image.asset("assets/images/createaccount/gender.png",),
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
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please select a gender";
                                    }
                                    return null;
                                  },
                                  items: genderOptions.map((gender){
                                    return DropdownMenuItem<String>(
                                      value: gender['value'],
                                      child: Row(
                                        children: [
                                          Text(gender['label']),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                )
                            ),
                            SizedBox(height: 20,),
                            Container(
                              alignment: Alignment(-0.8, 0),
                              child: Text("Date of Birth",
                                style: TextStyle(
                                    color: Color(0xFF2D2727),
                                    fontWeight:FontWeight.bold,
                                    fontSize: 16
                                ),),
                            ),
                            SizedBox(height: 5,),
                            Container(
                              width: 310,
                              child:  TextFormField(
                                canRequestFocus: false,
                                keyboardType: TextInputType.none,
                                controller: _datePickerController,
                                decoration: InputDecoration(
                                  prefixIcon: Image.asset("assets/images/createaccount/dob.png",),
                                  suffixIcon: Icon(Icons.calendar_month),
                                  hintText: "Date of Birth",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Required";
                                  }
                                  return null;
                                },
                                onTap: () async {
                                  DateTime? datetime = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1950),
                                    lastDate: DateTime.now(),
                                  );
                                  if (datetime != null) {
                                    String formatDate = DateFormat('yyyy-MM-dd').format(datetime);
                                    setState(() {
                                      _datePickerController.text = formatDate;
                                    });
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: 30,),
                            Container(
                              width: 310,
                              height: 55,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape:  RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                      backgroundColor:Color(0xFF4D5E47),
                                      foregroundColor: Colors.white),
                                  onPressed: (){
                                    if(_formKey.currentState!.validate()){
                                      _signup();}
                                  }, child: Text("Register",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                            ),
                            SizedBox(height: 30,),
                          ],
                        ),
                      ),
                    ))
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
