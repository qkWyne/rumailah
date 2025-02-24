import 'package:flutter/material.dart';
class EditAccount extends StatefulWidget {
  const EditAccount({super.key});

  @override
  State<EditAccount> createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  String? selectedGender;
  final List<Map<String, dynamic>> genderOptions = [
    {'value': 'male', 'label': 'Male', 'icon': Icons.male},
    {'value': 'female', 'label': 'Female', 'icon': Icons.female},
  ];
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
            child:  Form(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        child:  CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Image.asset("assets/images/editaccount/edit.png",),
                        ),
                      ),
                      Container(
                        alignment: Alignment(-0.8, 0),
                        child: Text("Name",
                          style: TextStyle(
                              color: Color(0xFF2D2727),
                              fontWeight:FontWeight.bold,
                              fontSize: 16
                          ),),
                      ),
                      Container(
                        width: 310,
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: "User",
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
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "+923 021015901",
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
                        ),
                      ),
                      SizedBox(height: 15,),
                      Container(
                        alignment: Alignment(-0.8, 0),
                        child: Text("Email",
                          style: TextStyle(
                              color: Color(0xFF2D2727),
                              fontWeight:FontWeight.bold,
                              fontSize: 16
                          ),),
                      ),
                      Container(
                        width: 310,
                        child: TextFormField(
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "Email",
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
                                )
                            ),
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
                      SizedBox(height: 15,),
                      Container(
                        alignment: Alignment(-0.8, 0),
                        child: Text("Date of Birth",
                          style: TextStyle(
                              color: Color(0xFF2D2727),
                              fontWeight:FontWeight.bold,
                              fontSize: 16
                          ),),
                      ),
                      Container(
                        width: 310,
                        child: TextFormField(
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "05-05-2000",
                              hintStyle: TextStyle(color: Color(0xFFB9B7B7)),
                              prefixIcon: Image.asset("assets/images/createaccount/dob.png",),
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
                        ),
                      ),
                      SizedBox(height: 25,),
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
                            }, child: Text("Update",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
