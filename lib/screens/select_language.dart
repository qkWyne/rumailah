import 'package:flutter/material.dart';
import 'package:rumailah/screens/login_otp.dart';
class SelectLanguage extends StatefulWidget {
  const SelectLanguage({super.key});

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  String selectedLanguage = "English";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFF4D5E47),
      body:Column(
        children: [
          Container(
            height: 200,
            child:  Center(
                child: Image.asset("assets/images/selectlanguagescreen/logo.png")
            ),
          ),
          Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20))
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 30,),
                      Align(
                        alignment: Alignment(-0.6,0),
                        child: Text("Please Select App Language",style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 18,color: Color(0xFF4D5E47)),),
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedLanguage = "English";
                          });
                        },
                        child: selectedLanguage == "English" ? Container(
                          width: 320,
                          height: 65,
                          decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Color(0xFF4D5E47),)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Color(0xFFDFEEDA),
                                  child: const Text('E',style: TextStyle(color:  Color(0xFF4D5E47),
                                  fontWeight: FontWeight.bold,fontSize: 18),),
                                ),
                                SizedBox(width: 10,),
                                Text("English",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:  Color(0xFF4D5E47),),),
                              ],
                            ),
                          ),
                        ) : Container(
                          width: 320,
                          height: 65,
                          decoration:BoxDecoration(
                            color: Color(0xFFDFEEDA),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Color(0xFF4D5E47),
                                  child: const Text('E',style: TextStyle(color:  Color(0xFFDFEEDA),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),),
                                ),
                                SizedBox(width: 10,),
                                Text("English",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:  Color(0xFF4D5E47),),),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedLanguage = "Arabic";
                          });
                        },
                        child: selectedLanguage == "Arabic" ? Container(
                          width: 320,
                          height: 65,
                          decoration:BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Color(0xFF4D5E47),)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Color(0xFFDFEEDA),
                                  child: const Text('AE',style: TextStyle(color:  Color(0xFF4D5E47),
                                      fontWeight: FontWeight.bold,fontSize: 18),),
                                ),
                                SizedBox(width: 10,),
                                Text("اَلْعَرَبِيَّة",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:  Color(0xFF4D5E47),),),
                              ],
                            ),
                          ),
                        ): Container(
                          width: 320,
                          height: 65,
                          decoration:BoxDecoration(
                            color: Color(0xFFDFEEDA),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Color(0xFF4D5E47),
                                  child: const Text('AE',style: TextStyle(color:  Color(0xFFDFEEDA),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),),
                                ),
                                SizedBox(width: 10,),
                                Text("اَلْعَرَبِيَّةُ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:  Color(0xFF4D5E47),),),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Image.asset("assets/images/selectlanguagescreen/pic.png"),
                      ),
                      Container(
                        width: 330,
                        height: 55,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape:  RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                backgroundColor:Color(0xFF4D5E47),
                                foregroundColor: Colors.white),
                            onPressed: (){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginOtp()));
                            }, child: Text("Okay",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                      ),


                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
