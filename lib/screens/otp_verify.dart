import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerify extends StatefulWidget {
  @override
  _OtpVerifyState createState() => _OtpVerifyState();
}

class _OtpVerifyState extends State<OtpVerify> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
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
                    child: Column(
                      children: [
                        SizedBox(height: 30,),
                        Align(
                          alignment: Alignment(-0.7,0),
                          child: Text("OTP Verification",style: TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 25,color: Color(0xFF4D5E47)),),
                        ),
                        SizedBox(height: 5),
                        Align(
                          alignment: Alignment(-0.7,0),
                          child: Container(
                            child: RichText(text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: "Please Enter OTP Sent To",
                                      style: TextStyle(color: Color(0xFF9C9E9E),
                                          fontSize: 16)),
                                  TextSpan(text: "\n+971 5555 55555",
                                      style: TextStyle(fontSize: 16,
                                          fontWeight: FontWeight.bold,color: Color(0xFFEF6010))),
                                ]
                            )),
                          ),
                        ),
                        SizedBox(height: 25,),
                        Container(
                          width: 300,
                          child:   PinCodeTextField(
                            showCursor: true,
                            cursorColor: Color(0xFF4D5E47),
                            enableActiveFill: true,
                            appContext: context,
                            length: 4,
                            onChanged: (value) {},
                            controller: otpController,
                            textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(10),
                              fieldHeight: 65,
                              fieldWidth: 65,
                              activeColor: Color(0xFF4D5E47),
                              selectedColor: Color(0xFF4D5E47),
                              inactiveColor: Color(0xFFE9F3E5),
                              activeFillColor: Colors.white,
                              selectedFillColor: Colors.white,
                              inactiveFillColor: Color(0xFFE9F3E5),

                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        SizedBox(height: 5,),
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
                        SizedBox(height: 25,),
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
                              }, child: Text("Verify",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                        ),
                        SizedBox(height: 10,),
                        Text("I did not receive a code",style: TextStyle(fontSize: 18),),
                        SizedBox(width: 8,),
                        InkWell(
                                  onTap: (){},
                                  child: Text("Resend",style: TextStyle(color: Color(0xFFAF263C),fontWeight: FontWeight.bold,fontSize: 18),)),



                      ],
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
