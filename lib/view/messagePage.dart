import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lecle_downloads_path_provider/lecle_downloads_path_provider.dart';
import 'package:paitent_doctor_chat_app/view/replyPage.dart';
import 'package:paitent_doctor_chat_app/view/widgets/messageButton.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  static Future<void> _write(String filename, String content) async {
    String? downloadsDirectoryPath =
        (await DownloadsPath.downloadsDirectory())?.path;
    final path = '$downloadsDirectoryPath/$filename';
    final file = File(path);
    file.open(mode: FileMode.append);
    await file.writeAsString(content, mode: FileMode.append);
  }

  @override
  void initState() {
    // TODO: implement initState
    _write("Doctor's_Replies.txt",
        "\n\n=======New Response=======\n=================");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Messages"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.teal.shade500,
      ),
      body: Container(
        width: sWidth,
        color: Colors.grey.shade100,
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("  Today"),
                    ),
                    Divider(),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReplyPage(
                            reciverName: "John",
                            proPic: 'profilePicture/pro5.jpg',
                            fullMessage:
                                "Your recommended medication was ideal for my situation. I took the prescribed medicine daily, and I feel completely recovered. Thank you very much. It felt like a great weight had been lifted off my shoulders.",
                          ),
                        ),
                      ),
                      child: MessageListButoon(
                        name: "John",
                        proPic: 'profilePicture/pro5.jpg',
                        timeMessaged: "Mar 15,2022",
                        partMessageText:
                            "Your recommended medication was ideal...",
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReplyPage(
                            reciverName: "Fiana",
                            proPic: 'profilePicture/pro2.jpg',
                            fullMessage:
                                "Hey this is Fiana, Thanks for your time, I am fully recovered now.",
                          ),
                        ),
                      ),
                      child: MessageListButoon(
                        name: "Fiana",
                        proPic: 'profilePicture/pro2.jpg',
                        timeMessaged: "Mar 05,2022",
                        partMessageText:
                            "Hey this is Fiana, Thanks for your time...",
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReplyPage(
                            reciverName: "Rose",
                            proPic: 'profilePicture/pro1.jpg',
                            fullMessage:
                                "Hello Doctor, now, I am fully recovered. Thank you for saving my life, and without your immense support, I would not be able to deal with this deadly disease. May God bless you and your family members.",
                          ),
                        ),
                      ),
                      child: MessageListButoon(
                        name: "Rose",
                        proPic: 'profilePicture/pro1.jpg',
                        timeMessaged: "Jan 15,2022",
                        partMessageText:
                            "Hello Doctor, now, I am fully recovered...",
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReplyPage(
                            reciverName: "Chy",
                            proPic: 'profilePicture/pro3.jpg',
                            fullMessage:
                                "Thank you, doctor, for taking the time to look after me properly. You were always on time. Great job.",
                          ),
                        ),
                      ),
                      child: MessageListButoon(
                        name: "Chy",
                        proPic: 'profilePicture/pro3.jpg',
                        timeMessaged: "Jan 15,2021",
                        partMessageText:
                            "Thank you, doctor, for taking the time...",
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReplyPage(
                            reciverName: "Himel",
                            proPic: 'profilePicture/pro6.jpg',
                            fullMessage:
                                "Hi Doctor, I am overwhelmed by your tremendous support and inspiration. It was tough for me to survive throughout these quarantine days and thank you for taking the risk of your life for saving me.",
                          ),
                        ),
                      ),
                      child: MessageListButoon(
                        name: "Himel",
                        proPic: 'profilePicture/pro6.jpg',
                        timeMessaged: "Apr 05,2021",
                        partMessageText:
                            "Hi Doctor, I am overwhelmed by your treme...",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
