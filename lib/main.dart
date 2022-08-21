import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'dart:math';
import './Homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
        builder: (context, oreintation, devicetype) {
          return MaterialApp(
            home: LoginPage(),
            debugShowCheckedModeBanner: false,
          );
        }
    );
  }
}
class LoginPage extends StatefulWidget {
   LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController mobilenumber=TextEditingController();
  final TextEditingController otpnumber1=TextEditingController();
  final TextEditingController otpnumber2=TextEditingController();
  final TextEditingController otpnumber3=TextEditingController();
  final TextEditingController otpnumber4=TextEditingController();

  var otpnumber='';
  int minvalue=1000;
  int maxvalue=10000;
  var otp='';
  List<String> recipients=[];

  void _sendingsms(String message,List<String> recipients) async{
    String _result=await sendSMS(message: message,recipients: recipients,sendDirect: true);
    print(_result);
  }


  authentication(){
    if(otp==otpnumber){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("you are logged in ",style: TextStyle(
        fontSize: 16.sp,color: Colors.grey),)));
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage()));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Wrong OTP number entered ",style:
        TextStyle(fontSize: 16.sp,color: Colors.red),)));
    }
    otp='';
    recipients.clear();
    otpnumber='';
    setState((){});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:Padding(
        padding: EdgeInsets.all(1.h),
        child: Stack(
            children: [
              Image(image: AssetImage("assets/images/vegetable.png"),fit: BoxFit.fill,width: 98.w,height: 98.h,
              filterQuality: FilterQuality.low,alignment: Alignment.center,),
              if(otp.isEmpty)...[
                Positioned(
                  top: 6.h,
                  left: 4.h,
                  child:Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Log in",style: TextStyle(fontSize: 22.sp,fontWeight: FontWeight.w500, color: Colors.white)),
                      Text("Please log in to continue",style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w300,color: Colors.white)),
                    ]
                  ),
                ),
                Positioned(
                  bottom: 3.h,
                  right: 2.h,
                  left: 2.h,
                  child: Card(
                    color: Colors.white,
                    child: SizedBox(
                      height: 25.h,
                      width: 92.w,
                      child: Padding(
                        padding:EdgeInsets.all(2.h),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children:[
                              Text(" Log in",style: TextStyle(fontSize: 22.sp,fontWeight: FontWeight.w600),),
                              TextField(controller:mobilenumber,decoration: InputDecoration(label: Text("Mobile Number",style: TextStyle(fontWeight: FontWeight.w400,
                              color: Colors.black)),isDense: true,prefixIcon: Icon(Icons.phone_android_outlined,size: 4.h,
                                color: Colors.red,), hintText: 'Mobile Number',hintStyle: TextStyle(fontWeight: FontWeight.w400,),),
                                keyboardType: TextInputType.number,
                              ),
                              MaterialButton(
                                color: Colors.red,
                                minWidth: 90.w,
                                visualDensity: VisualDensity.comfortable,
                                onPressed: (){
                                  recipients.add(mobilenumber.text);
                                  otp=(Random().nextInt(maxvalue-minvalue)+minvalue).toString();
                                  _sendingsms(otp,recipients);
                                  setState((){ });
                                  },
                                child: Text("Get OTP",style: TextStyle(fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,color: Colors.white), textAlign: TextAlign.center,),),
                            ]
                        ),
                      ),
                    ),
                  ),
                ),
              ]else ...[
                Positioned(
                  top: 6.h,
                  left: 4.h,
                  child:Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("OTP Verification",style: TextStyle(fontSize: 22.sp,fontWeight: FontWeight.w500, color: Colors.white)),
                        Text("Please enter OTP Code We sent ",style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w300,color: Colors.white)),
                        Text("to the mobile number  ${recipients.first } ",style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w300,color: Colors.white)),

                      ]
                  ),
                ),
                Positioned(
                  bottom: 3.h,
                  right: 2.h,
                  left: 2.h,
                  child: Card(
                    color: Colors.white,
                    child: SizedBox(
                      height: 25.h,
                      width: 92.w,
                      child: Padding(
                        padding:EdgeInsets.all(2.h),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children:[
                              Text(" OTP ",style: TextStyle(fontSize: 22.sp,fontWeight: FontWeight.w600),),
                              Padding(
                                padding: EdgeInsets.only(left: 0.0,top: 2.h,right:0.0,bottom: 0.0),
                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children:[
                                  SizedBox(
                                    width: 10.w,
                                    height: 10.w,
                                    child: TextField(controller:otpnumber1,decoration: InputDecoration(isDense: true,
                                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red),),enabled:true, ),
                                      keyboardType: TextInputType.number,),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                    height: 10.w,
                                    child: TextField(controller:otpnumber2,decoration: InputDecoration(isDense: true,
                                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),enabled: true),
                                      keyboardType: TextInputType.number,),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                    height: 10.w,
                                    child: TextField(controller:otpnumber3,decoration: InputDecoration(isDense: true,
                                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),enabled: true),
                                      keyboardType: TextInputType.number,),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                    height: 10.w,
                                    child: TextField(controller:otpnumber4,decoration: InputDecoration(isDense: true,
                                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),enabled: true),
                                      keyboardType: TextInputType.number,),
                                  ),
                                ]),
                              ),
                              SizedBox(
                                height: 10.h,
                                width: 88.w,
                                child: Stack(
                                  children: [
                                    Positioned(top:0,
                                      child: MaterialButton(
                                        color: Colors.red,
                                        minWidth: 80.w,
                                        visualDensity: VisualDensity.comfortable,
                                        onPressed: (){
                                          authentication();
                                          setState((){
                                            otpnumber=otpnumber1.text+otpnumber2.text+otpnumber3.text+otpnumber4.text;
                                          });
                                        },
                                        child: Text("Confirm OTP",style: TextStyle(fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,color: Colors.white), textAlign: TextAlign.center,),),
                                    ),
                                    Positioned(
                                      top: 3.5.h,
                                      right: 1.h,
                                      child: TextButton(
                                          onPressed: (){
                                            recipients.add(mobilenumber.text);
                                            otp=(Random().nextInt(maxvalue-minvalue)+minvalue).toString();
                                            _sendingsms(otp,recipients);
                                            setState((){ });
                                            authentication();
                                            },
                                          child: Text("Resend",style: TextStyle(fontSize: 16.sp,color: Colors.red))
                                      ),
                                    ),
                                  ]
                                ),
                              )
                            ]
                        ),
                      ),
                    ),
                  ),
                ),
              ]
          ],
        ),
      ),
    );
  }
}