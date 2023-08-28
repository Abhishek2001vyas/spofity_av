import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spofity/page/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Ser/firebase.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(actions: [
      ElevatedButton(
          onPressed: () async {
             final SharedPreferences qwe=await SharedPreferences.getInstance();
            qwe.remove('phoneController');
            await Fir().sigOut();
            Get.off(Login());
          },
          child: Text("logout"))
    ]),);
  }
}
