import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whatsappnew/Utils/colors.dart';

class statusPage extends StatefulWidget {
  const statusPage({super.key});

  @override
  State<statusPage> createState() => _statusPageState();
}

class _statusPageState extends State<statusPage> {
  bool location = true;
  void small() {
    setState(() {
      location = !location;
    });
  }

  List<profiles> img = [];
  Column profile(int index) {
    if (index == 0) {
      return const Column(
        children: [
          CircleAvatar(
            radius: 30,
            foregroundImage: AssetImage("assets/images/Eminem.jpg"),
          ),
          Text("name"),
        ],
      );
    } else {
      return const Column(
        children: [
          CircleAvatar(
            radius: 30,
            foregroundImage: AssetImage("assets/images/Eminem.jpg"),
          ),
          Text("name"),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 17, left: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Status",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                PopupMenuButton(
                    offset: const Offset(0, 50),
                    itemBuilder: (context) => <PopupMenuEntry>[
                          const PopupMenuItem(child: Text("Status privacy"))
                        ])
              ],
            ),
          ),
          Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [profile(index)],
                  ),
                );
              },
              itemCount: 7,
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(top: 17, left: 12, right: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Channels",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                )
              ],
            ),
          ),
          const Divider(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Appcolors.Lightgreen,
        onPressed: () {
          small();
        },
        child: Icon(
          Icons.photo_camera,
          color: Colors.white,
        ),
      ),
    );
  }
}

class profiles {
  final Images;
  final name;
  profiles({required this.Images, required this.name});
}
