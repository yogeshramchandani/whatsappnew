import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whatsappnew/Utils/colors.dart';

class chatscreeen extends StatefulWidget {
  final String name;
  final String lastmessage;
  final String pimagePath; // Changed from Image to String
  const chatscreeen(
      {Key? key,
      required this.name,
      required this.lastmessage,
      required this.pimagePath})
      : super(key: key); // Added 'super(key: key)'

  @override
  State<chatscreeen> createState() =>
      _chatscreeenState(); // Removed unnecessary parameters from createState
}

class _chatscreeenState extends State<chatscreeen> {
  late final String name;
  late final String lastmessage;
  late final String pimagePath;

  @override
  void initState() {
    super.initState();
    name = widget.name;
    lastmessage = widget.lastmessage;
    pimagePath = widget.pimagePath;
  }

  @override
  Widget build(BuildContext context) {
    double widthhh = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 20,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              foregroundImage: AssetImage(
                pimagePath,
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Text(name),
          ],
        ),
        actions: [
          PopupMenuButton(
            offset: const Offset(0, 50),
            color: const Color.fromARGB(255, 255, 255, 255),
            itemBuilder: ((context) => <PopupMenuEntry>[
                  const PopupMenuItem(
                    child: ListTile(
                      title: Text("View contact"),
                    ),
                  ),
                  const PopupMenuItem(
                    child: ListTile(
                      title: Text("Media,links,and docs"),
                    ),
                  ),
                  const PopupMenuItem(
                    child: ListTile(
                      title: Text("Search"),
                    ),
                  ),
                  const PopupMenuItem(
                    child: ListTile(
                      title: Text("Mute notifications"),
                    ),
                  ),
                  const PopupMenuItem(
                    child: ListTile(
                      title: Text("Dissappearing messages"),
                    ),
                  ),
                  const PopupMenuItem(
                    child: ListTile(
                      title: Text("Wallpaper"),
                    ),
                  ),
                  const PopupMenuItem(
                    child: ListTile(
                      title: Text("More"),
                    ),
                  ),
                ]),
          )
        ],
      ),
      body: Stack(children: [
        Column(
          children: [
            Expanded(
                child: Image(
                    width: widthhh,
                    fit: BoxFit.cover,
                    image: const NetworkImage(
                        "https://user-images.githubusercontent.com/15075759/28719144-86dc0f70-73b1-11e7-911d-60d70fcded21.png"))),
          ],
        ),
        const Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextField(
              cursorColor: Appcolors.Lightgreen,
              decoration: InputDecoration(
                  hintText: "Message",
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0)),
                    
            )
          ],
        )
      ]),
    );
  }
}
