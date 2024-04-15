import 'package:flutter/material.dart';
import 'package:whatsappnew/Utils/colors.dart';
import 'package:badges/badges.dart' as badges;

class communities extends StatefulWidget {
  const communities({super.key});

  @override
  State<communities> createState() => _communitiesState();
}

class _communitiesState extends State<communities> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: badges.Badge(
            badgeStyle: const badges.BadgeStyle(
                padding: EdgeInsets.all(2),
                badgeColor: Appcolors.Lightgreen,
                borderSide: BorderSide(color: Colors.white, width: 2)),
            position: badges.BadgePosition.bottomEnd(bottom: -5),
            badgeContent: const Icon(
              Icons.add,
              size: 18,
              color: Colors.white,
            ),
            child: Container(
              padding: const EdgeInsets.only(left: 7, right: 7, top: 7, bottom: 7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: const Color.fromARGB(159, 156, 155, 153),
              ),
              child: const Icon(
                Icons.groups_2,
                size: 35,
                color: Colors.white,
              ),
            ),
          ),
          title: const Text(
            "New Community",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 10,
          color: const Color.fromARGB(116, 180, 180, 177),
        ),
        const SizedBox(
          height: 10,
        ),
        ListTile(
          leading: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: const Color.fromARGB(255, 156, 155, 153),
              ),
              child: const Image(
                image: AssetImage("assets/images/karma.jpeg"),
                fit: BoxFit.cover,
              )),
          title: const Text(
            "ABC Community",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
