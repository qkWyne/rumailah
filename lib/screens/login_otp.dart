import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:rumailah/screens/otp_verify.dart';

class LoginOtp extends StatefulWidget {
  const LoginOtp({super.key});

  @override
  State<LoginOtp> createState() => _LoginOtpState();
}

class _LoginOtpState extends State<LoginOtp> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor:Color(0xFF4D5E47),
        body:Column(
          children: [
            Container(
              height: 200,
              child:  Center(
                  child: Image.asset("assets/images/loginotp/logo.png")
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
                          alignment: Alignment(-0.7,0),
                          child: Text("Let's Get You Login",style: TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 20,color: Color(0xFF4D5E47)),),
                        ),
                        SizedBox(height: 10),
                        Align(
                          alignment: Alignment(-0.5,0),
                          child: Container(
                            child: RichText(text: TextSpan(
                               children: [
                                 TextSpan(
                                     text: "We will send you a",
                                     style: TextStyle(color: Color(0xFF9C9E9E),
                                     fontSize: 16)),
                    
                                 TextSpan(text: "\nOne Time Password ",
                                     style: TextStyle(fontSize: 16,
                                     fontWeight: FontWeight.bold,color: Color(0xFFEF6010))),
                                 TextSpan(text: " to this Number",
                                     style: TextStyle(color: Color(0xFF9C9E9E),
                                     fontSize: 16)),
                               ]
                            )),
                          ),
                        ),
                        SizedBox(height: 30,),
                        Container(
                          width: 330,
                          child: IntlPhoneField(
                            showCountryFlag: false,
                            cursorColor: Color(0xFF535557),
                    
                            style: TextStyle(color: Color(0xFF535557), fontSize: 18),
                            flagsButtonPadding: const EdgeInsets.all(10),
                            dropdownIconPosition: IconPosition.trailing,
                            decoration: const InputDecoration(
                              hintText: "Enter Phone Number",
                              hintStyle: TextStyle(color: Color(0xFF535557)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 2,color: Color(0xFF4D5E47)),
                            ),
                              border:OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF4D5E47))),
                              contentPadding: EdgeInsets.symmetric(vertical: 20),
                            ),
                            dropdownTextStyle: TextStyle(color: Color(0xFF4D5E47), fontSize: 16),
                            dropdownIcon: Icon(Icons.arrow_drop_down, color: Color(0xFF4D5E47)),
                            initialCountryCode: 'PK',
                    
                            onChanged: (phone) {
                              print(phone.completeNumber);
                            },
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          child: RichText(text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "By continuing. you agree to our ",
                                    style: TextStyle(color: Color(0xFF9C9E9E))),
                                TextSpan(text: "Refund, Terms & Polices",
                                    style: TextStyle(fontSize: 12,
                                        fontWeight: FontWeight.bold,color: Color(0xFF4D5E47))),
                              ]
                          )),
                        ),
                        SizedBox(height: 30,),
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
                                Navigator.push(context, MaterialPageRoute(builder: (context) => OtpVerify()));
                              }, child: Text("Get OTP",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don’t have account ?",style: TextStyle(fontSize: 18),),
                              SizedBox(width: 8,),
                              InkWell(
                                  onTap: (){},
                                  child: Text("Create",style: TextStyle(color: Color(0xFFEF6010),fontWeight: FontWeight.bold,fontSize: 18),)),
                            ],
                          ),
                        ),
                    
                    
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
