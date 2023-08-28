import 'package:flutter/material.dart';
import 'package:spofity/controller/auth.dart';
import 'package:spofity/page/Home2.dart';
import 'package:spofity/page/signup.dart';
import 'package:spofity/page/verfiy.dart';
import 'package:spofity/widget/button.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import '../Ser/firebase.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Login extends StatefulWidget {
  const Login({super.key});
  static String verify="";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // final  controller = Get.put(Auth());
  final _formkey = GlobalKey<FormState>();
  TextEditingController countryController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    countryController.text = "+91";
    super.initState();
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * .1),
                Center(
                    child: Image.asset(
                  "assets/images/1.png",
                  scale: 5,
                )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Icon(Icons.lock, color: Colors.white, size: 150),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("We will send you OTP to this number ",
                      style: TextStyle(color: Colors.white)),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 8.0, left: 8, bottom: 10),
                  child: Text("Enter Moblie Number",
                      style: TextStyle(color: Colors.white)),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .8,
                  child: TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Colors.white)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.white)),
                      hintText: "Moblie no",
                      hintStyle: TextStyle(color: Colors.white),
                      prefixIcon: const Icon(
                        Icons.call,
                        color: Colors.white,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value!.isEmpty) {
                        return "please enter number?";
                      } else if (value == null || value!.length < 6) {
                        return " please enter least 10 number";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 10),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      width: MediaQuery.of(context).size.width * .5,
                      height: MediaQuery.of(context).size.height / 15,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            backgroundColor:
                            MaterialStateProperty.all(Colors.white)),
                        onPressed: ()async {
                          final SharedPreferences qwe = await SharedPreferences.getInstance();
                          qwe.setString('phoneController', phoneController.text);
                          if (_formkey.currentState!.validate()) {
                            // Get.to(Verfiy());
                            setState(() {
                              isLoading = true;
                            });

                            await FirebaseAuth.instance.verifyPhoneNumber(
                              phoneNumber:
                              '${countryController.text + phoneController.text} ',
                              verificationCompleted:
                                  (PhoneAuthCredential credential) {},
                              verificationFailed: (FirebaseAuthException e) {},
                              codeSent:
                                  (String verificationId, int? resendToken) {
                                Login.verify = verificationId;
                                Get.to(Verfiy());


                                  },
                              codeAutoRetrievalTimeout:
                                  (String verificationId) {},
                            );
                            // we had used future delayed to stop loading after
                            // 3 seconds and show text "submit" on the screen.

                          }
                        },
                        child: Text("send OTP",
                            style: TextStyle(color: Colors.black)),
                      )),


                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("OR",
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                      onTap: () async {
                        await Fir().signInWithGoogle();
                        Get.to(Home());
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Image.asset(
                            "assets/images/google.png",
                            scale: 16,
                          ))),
                ),
                // SizedBox(height: MediaQuery.of(context).size.height * .1),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Alerady have account ?",
                          style: TextStyle(color: Colors.white)),
                      TextButton(
                          onPressed: () {
                            Get.to(Signup());
                          },
                          child: const Text("signin"))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
