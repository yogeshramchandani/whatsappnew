import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsappnew/Pages/chat_message.dart';
import 'package:whatsappnew/providers.dart';

class chatscreeen extends StatefulWidget {
  final String name;
  final String lastmessage;
  final String pimagePath;

  const chatscreeen({
    Key? key,
    required this.name,
    required this.lastmessage,
    required this.pimagePath,
  }) : super(key: key);

  @override
  State<chatscreeen> createState() => _chatscreeenState();
}

class _chatscreeenState extends State<chatscreeen> {
  late final String name;
  late final String lastmessage;
  late final String pimagePath;
  final TextEditingController _textEditor = TextEditingController();

  @override
  void initState() {
    super.initState();
    name = widget.name;
    lastmessage = widget.lastmessage;
    pimagePath = widget.pimagePath;
  }

  @override
  Widget build(BuildContext context) {
    chatprovider provider = Provider.of<chatprovider>(context);
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 20,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              foregroundImage: AssetImage(pimagePath),
            ),
            const SizedBox(width: 12),
            Text(name),
          ],
        ),
        actions: [
          PopupMenuButton(
            offset: const Offset(0, 50),
            color: Colors.white,
            itemBuilder: ((context) => <PopupMenuEntry>[
              const PopupMenuItem(
                child: ListTile(
                  title: Text("View contact"),
                ),
              ),
              const PopupMenuItem(
                child: ListTile(
                  title: Text("Media, links, and docs"),
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
                  title: Text("Disappearing messages"),
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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/whatsapp backgrouned.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                itemCount: provider.messages.length,
                padding: const EdgeInsets.all(8.0),
                reverse: true,
                itemBuilder: (_, int index) {
                  return Container(
                    color: Colors.transparent,
                    child: provider.messages[index],
                  );
                },
              ),
            ),
            const Divider(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Flexible(
                  child: TextField(
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter message",
                      hintStyle: TextStyle(color: Colors.black26),
                      contentPadding: EdgeInsets.only(left: 10),
                    ),
                    controller: _textEditor,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  child: IconButton(
                    onPressed: () {
                      if (_textEditor.text.isNotEmpty) {
                        provider.handleSubmit(_textEditor.text); 
                        _textEditor.clear();
                      }
                    },
                    icon: const Icon(Icons.send),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
