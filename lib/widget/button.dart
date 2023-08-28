import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../page/verfiy.dart';

class Button extends StatefulWidget {
  final Color color;
  final String text;
  final Color color2;
  final String Key;

  const Button(
      {super.key,
      required this.color,
      required this.text,
      required this.color2, required this.Key});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            decoration: BoxDecoration(
                color: widget.color, borderRadius: BorderRadius.circular(20)),
            width: MediaQuery.of(context).size.width * .5,
            height: MediaQuery.of(context).size.height /15,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(widget.color)),
              onPressed: () {
               //  var qwe=widget.Key;
               // if(qwe.currentState!.validate()){
               //   Get.to(Verfiy());
               // }

              },
              child: Text(widget.text, style: TextStyle(color: widget.color2)),
            )));
  }
}
