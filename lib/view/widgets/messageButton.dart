import 'package:flutter/material.dart';

class MessageListButoon extends StatelessWidget {
  final dynamic onTap;

  final String? partMessageText;

  final String? timeMessaged;

  final String? name;
  String? proPic = "profilePicture/pro5.jpg";

  MessageListButoon({
    Key? key,
    this.onTap,
    this.partMessageText,
    this.timeMessaged,
    this.name,
    this.proPic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 15.0,
              ),
              CircleAvatar(
                backgroundColor: Colors.black,
                backgroundImage: AssetImage(
                  "assets/images/${proPic ?? 'DR-avatar.png'}",
                ),
              ),
              SizedBox(
                width: 15.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name ?? ""),
                  Text(
                    timeMessaged ?? "",
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    width: sWidth * 0.78,
                    child: Text(partMessageText ?? ""),
                  ),
                ],
              )
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
