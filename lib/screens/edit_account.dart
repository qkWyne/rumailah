import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
class EditAccount extends StatefulWidget {
  const EditAccount({super.key});

  @override
  State<EditAccount> createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  TextEditingController _firstnameController = TextEditingController();
  TextEditingController _lastnameController = TextEditingController();
  TextEditingController _phoneNoController = TextEditingController();
  TextEditingController _datePickerController = TextEditingController();
  GlobalKey<FormState> _FormKey = GlobalKey<FormState>();
  String uid = FirebaseAuth.instance.currentUser!.uid;
  String? selectedGender;
  final ImagePicker _picker = ImagePicker();
  File? _image;


  _updateProfile(docID) async {
    try {
      await FirebaseFirestore.instance.collection("users").doc(uid).update({
        "userID":uid,
        "userLast_Update":DateTime.now(),
        "firstName":_firstnameController.text,
        "lastName":_lastnameController.text,
        "userPhoneNo":_phoneNoController.text,
        "userGender":selectedGender,
        "userDOB":_datePickerController.text,
      });

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      print("Error $e");
    }
  }


  Future<void> pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null) return;

    File imageFile = File(pickedFile.path);
    setState(() {
      _image = imageFile;
    });

    List<int> imageBytes = await imageFile.readAsBytes();
    String base64Image = base64Encode(imageBytes);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('saved_image', base64Image);
    print("Image Saved in SharedPreferences");
  }

  Future<void> loadImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? base64Image = prefs.getString('saved_image');

    if (base64Image != null) {
      List<int> imageBytes = base64Decode(base64Image);
      File imageFile = File('${Directory.systemTemp.path}/temp_image.png');
      await imageFile.writeAsBytes(imageBytes);

      setState(() {
        _image = imageFile;
      });
      print("Image Loaded from SharedPreferences");
    } else {
      print("No Image Found!");
    }
  }



  _loadUserData() async {
    try {
      DocumentSnapshot userDoc =
      await FirebaseFirestore.instance.collection("users").doc(uid).get();

      if (userDoc.exists) {
        Map<String, dynamic> data = userDoc.data() as Map<String, dynamic>;

        setState(() {
          _firstnameController.text = data["firstName"] ?? "";
          _lastnameController.text = data["lastName"] ?? "";
          _phoneNoController.text = data["userPhoneNo"] ?? "";
          _datePickerController.text = data["userDOB"] ?? "";
          selectedGender = data["userGender"] ?? "";
        });
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
  }


  final List<Map<String, dynamic>> genderOptions = [
    {'value': 'male', 'label': 'Male',},
    {'value': 'female', 'label': 'Female',},
    {'value': 'other', 'label': 'Other',},
  ];


  @override
  void initState() {
    super.initState();
    _loadUserData();
    loadImage();
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Edit Profile",style: TextStyle(color: Color(0xFF6E7075)),),
        ),
        body: Container(
          color: Color(0xFFF7F6F6),
          child: Center(
            child:  SingleChildScrollView(
              child: Form(
                key: _FormKey,
                  child: Column(
                      children: [
                        Container(
                          width: 160,  // Adjust according to your needs
                          height: 160,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: _image == null
                              ? Center(child: Icon(Icons.person,size: 40,))
                              : ClipOval(
                            child: Image.file(
                              File(_image!.path),
                              fit: BoxFit.cover, 
                              width: 160,
                              height: 160,
                            ),
                          ),
                        ),
                        IconButton(onPressed: (){
                          pickImage();
                        }, icon: Icon(Icons.add_a_photo)),
                        Container(
                          alignment: Alignment(-0.8, 0),
                          child: Text("First Name",
                            style: TextStyle(
                                color: Color(0xFF2D2727),
                                fontWeight:FontWeight.bold,
                                fontSize: 16
                            ),),
                        ),
                        Container(
                          width: 310,
                          child: TextFormField(
                            textCapitalization: TextCapitalization.sentences,
                            controller: _firstnameController,
                            decoration: InputDecoration(
                                hintText: "Enter First Name",
                                fillColor: Colors.white,
                                filled: true,
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
                        SizedBox(height: 15,),
                        Container(
                          alignment: Alignment(-0.8, 0),
                          child: Text("Last Name",
                            style: TextStyle(
                                color: Color(0xFF2D2727),
                                fontWeight:FontWeight.bold,
                                fontSize: 16
                            ),),
                        ),
                        Container(
                          width: 310,
                          child: TextFormField(
                            textCapitalization: TextCapitalization.sentences,
                            controller: _lastnameController,
                            decoration: InputDecoration(
                                hintText: "Enter Last Name",
                                fillColor: Colors.white,
                                filled: true,
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
                        SizedBox(height: 15,),
                        Container(
                          alignment: Alignment(-0.8, 0),
                          child: Text("Mobile",
                            style: TextStyle(
                                color: Color(0xFF2D2727),
                                fontWeight:FontWeight.bold,
                                fontSize: 16
                            ),),
                        ),
                        Container(
                          width: 310,
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            controller: _phoneNoController,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
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
                        SizedBox(height: 15,),
                        Container(
                          alignment: Alignment(-0.8, 0),
                          child: Text("Select Gender",
                            style: TextStyle(
                                color: Color(0xFF2D2727),
                                fontWeight:FontWeight.bold,
                                fontSize: 16
                            ),),
                        ),
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
                                  ),

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
                                if(_FormKey.currentState!.validate()){
                                  _updateProfile(uid);
                                }

                              }, child: Text("Update",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                        ),
                      ],
                    ),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
