import 'package:flutter/material.dart';
import 'package:rumailah/screens/allow_location.dart';
class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
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
                      SizedBox(height: 30,),
                      Container(
                        alignment: Alignment(-0.8, 0),
                        child: Text("Name",
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
                          decoration: InputDecoration(
                              hintText: "User",
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
                          decoration: InputDecoration(
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
                          decoration: InputDecoration(
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
                        child: TextFormField(
                          decoration: InputDecoration(
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
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> AllowLocation()));
                            }, child: Text("Next",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
