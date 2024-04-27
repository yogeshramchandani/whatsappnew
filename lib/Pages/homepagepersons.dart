import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsappnew/Pages/chatscreen.dart';
import 'package:whatsappnew/providers.dart';

class homepageChats extends StatefulWidget {
  @override
  State<homepageChats> createState() => _homepageChatsState();
}

class _homepageChatsState extends State<homepageChats> {
  @override
  Widget build(BuildContext context) {
    chatprovider provider = Provider.of<chatprovider>(context);
    List<List> chatpersons = [
      ["raftaar", "assets/images/raftar.jpg"],
    ];

    return ListView.builder(
      itemCount: chatpersons.length,
      itemBuilder: (context, index) {
        String lastMessage = provider.messages.isNotEmpty
            ? provider.messages.last.toString()
            : '';

        return ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => chatscreeen(
                          name: chatpersons[index][0],
                          lastmessage: lastMessage,
                          pimagePath: chatpersons[index][1],
                        )));
          },
          leading: CircleAvatar(
            radius: 25,
            foregroundImage: AssetImage("${chatpersons[index][1]}"),
          ),
          title: Text(
            "${chatpersons[index][0]}",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
          subtitle: Row(
            children: [
              lastMessage.isNotEmpty
                  ? Row(
                      children: [
                        Icon(Icons.check),
                        Text(provider.latestmessage.toString())
                      ],
                    )
                  : Text("No Messages yet!"),
            ],
          ),
        );
      },
    );
  }
}
