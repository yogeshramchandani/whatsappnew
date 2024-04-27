import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whatsappnew/Utils/colors.dart';

class callspage extends StatefulWidget {
  const callspage({super.key});

  @override
  State<callspage> createState() => _callspageState();
}

class _callspageState extends State<callspage> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 27,
            backgroundColor: Appcolors.Lightgreen,
            child: Image(
                image: AssetImage(
              "assets/images/icons8-link-24.png",
            )),
          ),
          title: Text(
            "Create call link",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          subtitle: const Text("Share a link for your whatsApp call"),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 9),
          child: Text(
            "Recent",
            style: TextStyle(
                fontSize: 18, color: Color.fromARGB(255, 102, 102, 102)),
          ),
        )
      ],
    );
  }
}
