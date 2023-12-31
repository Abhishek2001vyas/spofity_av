import 'dart:async';

import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';
import 'package:get/get.dart';
import 'package:spofity/page/Home2.dart';
import 'package:spofity/page/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
var finalname;

class ONborad extends StatefulWidget {
  const ONborad({super.key});

  @override
  State<ONborad> createState() => _ONboradState();
}

class _ONboradState extends State<ONborad> {


  Future getvali() async{
    final SharedPreferences qwe = await SharedPreferences.getInstance();
    var obtain = qwe.getString('phoneController');
    setState(() {
      finalname = obtain;
    });
    print(finalname);
  }
  late Material materialButton;
  late int index;
  final onboardingPagesList = [
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: background,
          border: Border.all(
            width: 0.0,
            color: background,
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 45.0,
                  vertical: 90.0,
                ),
                child: Image.asset('assets/images/1.png',
                    color: pageImageColor),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'SECURED BACKUP',
                    style: pageTitleStyle,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [

                      Text(
                        'Keep your files in closed safe so you can\'t lose them. Consider TrueNAS.',
                        style: pageInfoStyle,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 200),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    ),
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: background,
          border: Border.all(
            width: 0.0,
            color: background,
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 45.0,
                  vertical: 90.0,
                ),
                child: Image.asset('assets/images/chat.png',
                    color: pageImageColor),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'CHANGE AND RISE',
                    style: pageTitleStyle,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Text(
                        'Give others access to any file or folders you choose',
                        style: pageInfoStyle,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 200),
                    ],
                  ),


                ),
              ),
            ],
          ),
        ),
      ),
    ),
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: background,
          border: Border.all(
            width: 0.0,
            color: background,
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 45.0,
                  vertical: 90.0,
                ),
                child: Image.asset('assets/images/chat.png',
                    color: pageImageColor),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'EASY ACCESS',
                    style: pageTitleStyle,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Text(
                        'Reach your files anytime from any devices anywhere',
                        style: pageInfoStyle,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 200),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  ];
  @override
  void initState() {

    getvali().whenComplete(()async{
      Timer(Duration(milliseconds: 1),()=> Navigator.push(context, MaterialPageRoute(builder: (context) {
        return  finalname == null ? Login(): Home();
      },))
      );});
    super.initState();
    materialButton = _skipButton();
    index = 0;
  }

  Material _skipButton({void Function(int)? setIndex}) {
    return Material(
      borderRadius: defaultSkipButtonBorderRadius,
      color: defaultSkipButtonColor,
      child: InkWell(
        borderRadius: defaultSkipButtonBorderRadius,
        onTap: () {
          if (setIndex != null) {
            index = 2;
            setIndex(2);
          }
        },
        child: const Padding(
          padding: defaultSkipButtonPadding,
          child: Text(
            'Skip',
            style: defaultSkipButtonTextStyle,
          ),
        ),
      ),
    );
  }

  Material get _signupButton {

    return Material(
      borderRadius: defaultProceedButtonBorderRadius,
      color: defaultProceedButtonColor,
      child: InkWell(
        borderRadius: defaultProceedButtonBorderRadius,
        onTap: () {
          getvali();
        },
        child: const Padding(
          padding: defaultProceedButtonPadding,
          child: Text(
            'Signup',
            style: defaultProceedButtonTextStyle,
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Onboarding(pages: onboardingPagesList,
      onPageChange: (int pageIndex){
      index = pageIndex;
      },
        startPageIndex: 0,
        footerBuilder: (context, dragDistance, pagesLength, setIndex) {
          return DecoratedBox(
          decoration: BoxDecoration(
          color: background,
          border: Border.all(
          width: 0.0,
          color: background,
          ),
          ),
          child: ColoredBox(
          color: background,
          child: Padding(
          padding: const EdgeInsets.all(45.0),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          CustomIndicator(
          netDragPercent: dragDistance,
          pagesLength: pagesLength,
          indicator: Indicator(
          indicatorDesign: IndicatorDesign.polygon(
         polygonDesign: PolygonDesign(polygon: DesignType.polygon_circle)
          ),
          ),
          ),
          index == pagesLength - 1
          ? _signupButton
              : _skipButton(setIndex: setIndex)
          ],
          ),
          ),
          ));
          })
    );
  }
}
