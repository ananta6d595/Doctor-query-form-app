import 'package:flutter/material.dart';

import 'messagePage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Welcome to BLESS",
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: height * 0.12,
          ),
          Image.asset(
            "assets/images/DR-avatar.png",
            width: sWidth * 0.5,
          ),
          SizedBox(
            height: height * 0.2,
          ),
          GestureDetector(
            onTap: (() => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MessagePage()))),
            child: Container(
              width: sWidth * 0.53,
              height: 55.0,
              decoration: BoxDecoration(
                color: Colors.teal.shade300,
                borderRadius: const BorderRadius.all(
                   Radius.circular(10.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "See Messages",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 25.0,
                  ),
                  Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
