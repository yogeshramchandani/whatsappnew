import 'package:flutter/material.dart';
import 'package:whatsappnew/Utils/colors.dart';
import 'package:whatsappnew/calls.dart';
import 'package:whatsappnew/cmmunities.dart';
import 'package:whatsappnew/homepagepersons.dart';
import 'package:whatsappnew/updates.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String? title;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          title = "WhatsApp";
          break;
        case 1:
          title = "Updates";
          break;
        case 2:
          title = "Communities";
          break;
        case 3:
          title = "Calls";
          break;
        default:
          title = "WhatsApp";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        enableFeedback: false,
        useLegacyColorScheme: false,
        items: const [
          BottomNavigationBarItem(
            icon: Badge(
              backgroundColor: Appcolors.Lightgreen,
              label: Text("2"),
              child: Icon(Icons.chat_bubble),
            ),
            label: "Chats",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sync_rounded),
            label: "Updates",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.groups_2_outlined),
            label: "Communities",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call_outlined),
            label: "Calls",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Appcolors.Tealgreen,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedItemColor: const Color.fromARGB(255, 0, 0, 0),
        unselectedLabelStyle:
            TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 0, 0, 0)),
        title: Text(
          title ?? "WhatsApp",
          style: TextStyle(
            color: Appcolors.Lightgreen,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.camera_alt_outlined,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          PopupMenuButton(
            offset: Offset(0, 50),
            color: const Color.fromARGB(255, 255, 255, 255),
            itemBuilder: ((context) => <PopupMenuEntry>[
                  const PopupMenuItem(
                    child: ListTile(
                      title: Text("New group"),
                    ),
                  ),
                  const PopupMenuItem(
                    child: ListTile(
                      title: Text("New broadcast"),
                    ),
                  ),
                  const PopupMenuItem(
                    child: ListTile(
                      title: Text("Linked devices"),
                    ),
                  ),
                  const PopupMenuItem(
                    child: ListTile(
                      title: Text("Starred messages"),
                    ),
                  ),
                  const PopupMenuItem(
                    child: ListTile(
                      title: Text("Payments"),
                    ),
                  ),
                  const PopupMenuItem(
                    child: ListTile(
                      title: Text("Settings"),
                    ),
                  ),
                ]),
          )
        ],
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Appcolors.Lightgreen,
        onPressed: () {},
        child: const Icon(
          Icons.message,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return homepageChats();
      case 1:
        return statusPage();
      case 2:
        return communities();
      case 3:
        return callspage();
      default:
        return homepageChats();
    }
  }
}
