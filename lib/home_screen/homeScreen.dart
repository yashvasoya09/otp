import 'package:flutter/material.dart';
import 'dart:math';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController txtlength = TextEditingController();
  List l1 = [];
  int size = 0;
  int rnd = 0;
  int otp = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff15172B),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          //Text
          Text(
            "OTP Generator",
            style: TextStyle(color: Color(0xffF6DB87), fontSize: 40),
          ),
          //Text filed
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(80),
            child: TextField(
              controller: txtlength=TextEditingController(text: "$size"),
              style: TextStyle(color: Color(0xffFCF6BA)),
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffFCF6BA)),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffFCF6BA)),
                  ),
                  hintStyle: TextStyle(color: Colors.white38),
                  hintText: "Enter OTP Length."),
            ),
          ),
          //Button
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              size = int.parse(txtlength.text);
              Random rnd = Random();
              setState(() {
                otp = rnd.nextInt(999999999 - 100000000);
              });
            },
            child: Container(
              height: 65,
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  gradient: LinearGradient(
                      colors: [Color(0xffFFE8B8), Color(0xffF6DB87)])),
              child: Center(
                  child: Text(
                    "Generate OTP",
                    style: TextStyle(fontSize: 30),
                  )),
            ),
          ),
          //ans
          SizedBox(
            height: 80,
          ),
          Container(
            height: 75,
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              color: Color(0xffFFE8B8),
            ),
            alignment: Alignment.center,
            child: Text(
              "${(otp == 0) ? otp : otp.toString().substring(0, size)}",
              style: TextStyle(fontSize: 30, letterSpacing: 20),
            ),
          ),
          //Reset
          SizedBox(
            height: 80,
          ),
          InkWell(
            onTap: () {
              setState(() {
                size=0;
                otp=0;
              });
            },
            child: Container(
              width: 150,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  gradient: LinearGradient(
                      colors: [Color(0xffFFE8B8), Color(0xffF6DB87)])),
              child: Center(
                  child: Text(
                    "Clear",
                    style: TextStyle(fontSize: 25),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
