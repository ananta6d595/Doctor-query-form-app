import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lecle_downloads_path_provider/lecle_downloads_path_provider.dart';

import 'dart:io';

class ReplyPage extends StatefulWidget {
  final String? reciverName;
  final String? fullMessage;
  final String? proPic;

  ReplyPage({
    Key? key,
    this.reciverName,
    this.fullMessage,
    this.proPic,
  }) : super(key: key);

  @override
  State<ReplyPage> createState() => _ReplyPageState();
}

class _ReplyPageState extends State<ReplyPage> {
  File? _image;

  final _picker = ImagePicker();
  // Implementing the image picker
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  TextEditingController senderMessage = TextEditingController();

  String reply = "";
  String? sentMessage;

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
    _write("Doctor's_Replies.txt", "\n\n=> ${widget.reciverName!}\n");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(
                "assets/images/${widget.proPic}",
              ),
              backgroundColor: Colors.transparent,
              radius: 15.0,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(widget.reciverName ?? "No Name",
                style: const TextStyle(color: Colors.black)),
          ],
        ),
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        elevation: 0.4,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Stack(
        // width: sWidth,
        // color: Colors.grey.shade100,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Reciver Data Here
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.yellow.shade300,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                            width: sWidth * 0.7,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(widget.fullMessage!),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  // send message data here
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Column(
                      children: [
                        if (sentMessage != null)
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.blue.shade300,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                            width: sWidth * 0.7,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                sentMessage ?? "",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        if (_image != null)
                          SizedBox(
                            height: 10.0,
                          ),
                        if (_image != null)
                          Container(
                            alignment: Alignment.center,
                            width: sWidth * 0.67,
                            height: 300,
                            color: Colors.grey[300],
                            child: _image != null
                                ? Image.file(_image!, fit: BoxFit.cover)
                                : const Text('Please select an image'),
                          ),
                      ],
                    )
                  ]),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Divider(),
              Row(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: _openImagePicker,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Image.asset(
                            "assets/images/PngItem_801467.png",
                            scale: 35,
                            color: Colors.teal.shade500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Image.asset(
                          "assets/images/Smile-Emoji-Transparent-PNG.png",
                          scale: 16,
                          color: Colors.teal.shade500,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.gif_box_outlined,
                          size: 35.0,
                          color: Colors.teal.shade300,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: sWidth * 0.6,
                    child: TextFormField(
                      controller: senderMessage,
                      // ..text =
                      //     "${senderMessage.text} + ${emojiController.text}",
                      textDirection: TextDirection.ltr,
                      maxLines: 2,
                      minLines: 1,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: "Type your message",
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              sentMessage = senderMessage.text;
                              _write(
                                  "Doctor's_Replies.txt", " $sentMessage \n");
                            });
                            senderMessage.clear();
                          },
                          icon: Icon(Icons.send),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
