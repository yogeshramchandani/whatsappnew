import 'package:flutter/material.dart';
import 'package:whatsappnew/chatscreen.dart';

class homepageChats extends StatelessWidget {
  const homepageChats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<List> chatpersons = [
      ["raftaar", "assets/images/raftar.jpg", "album daal do"],
      ["Eminem", "assets/images/Eminem.jpg", "yes sir!"],
      ["Karma", "assets/images/karma.jpeg", "kese ho"],
      ["seedhe maut", "assets/images/seedhe-maut.jpg", "tera bhai"],
      ["bella", "assets/images/bella.jpg", "ok!"],
    ];

    return ListView.builder(
      itemCount: chatpersons.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => chatscreeen(
                          name: chatpersons[index][0],
                          lastmessage: chatpersons[index][2],
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
              Icon(Icons.check),
              SizedBox(width: 5),
              Text(chatpersons[index][2]),
            ],
          ),
        );
        
      },
    );
  }
}
