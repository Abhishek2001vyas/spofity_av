// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// import '../page/home.dart';
//
// class Auth extends GetxController {
//   var isLoading = true.obs;
//   var data = Get.arguments;
//
//
//   phone() async {
//     try
//     {
//         FirebaseAuth.instance.verifyPhoneNumber(
//           phoneNumber:
//           '${data[0].text + data[1].text} ',
//           verificationCompleted:
//               (PhoneAuthCredential credential) {},
//           verificationFailed: (FirebaseAuthException e) {},
//           codeSent:
//               (String verificationId, int? resendToken) {
//             Login.verify = verificationId;
//           },
//           codeAutoRetrievalTimeout:
//               (String verificationId) {},
//         );
//         }
//     finally {
//     isLoading(false);
//     }
//
//   }
// }