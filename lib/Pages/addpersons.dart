import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whatsappnew/Pages/NewContactpage.dart';
import 'package:whatsappnew/Utils/colors.dart';

class AddNewChats extends StatefulWidget {
  const AddNewChats({super.key});

  @override
  State<AddNewChats> createState() => _AddNewChatsState();
}

class _AddNewChatsState extends State<AddNewChats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Selected contacts"),
        actions: [
          const Icon(Icons.search),
          PopupMenuButton(
            offset: const Offset(50, 45),
            itemBuilder: (context) => <PopupMenuEntry>[
              const PopupMenuItem(child: Text("Invite a friend")),
              const PopupMenuItem(child: Text("Contacts")),
              const PopupMenuItem(child: Text("Refresh")),
              const PopupMenuItem(child: Text("Help"))
            ],
          )
        ],
      ),
      body: Column(children: [
        InkWell(
          onTap: () {},
          child: ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: Appcolors.Lightgreen,
              child: Icon(
                Icons.group_add,
                color: Colors.white,
                size: 28,
              ),
            ),
            title: Text(
              "New Group",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AddNewContactsPage()));
          },
          child: ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: Appcolors.Lightgreen,
              child: Icon(
                Icons.person_add_alt_1,
                color: Colors.white,
                size: 28,
              ),
            ),
            title: Text(
              "New contact",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {},
          child: ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: Appcolors.Lightgreen,
              child: Icon(
                Icons.groups,
                color: Colors.white,
                size: 28,
              ),
            ),
            title: Text(
              "New community",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
          ),
        ),
        contactswidget()
      ]),
    );
  }

  Widget contactswidget() {
    return Column(
      children: [
        Text("Contacts on WhatsApp"),
      ],
    );
  }
}
