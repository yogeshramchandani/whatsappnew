import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsappnew/Utils/colors.dart';
import 'package:whatsappnew/Pages/addpersons.dart';
import 'package:whatsappnew/Pages/calls.dart';
import 'package:whatsappnew/Pages/cmmunities.dart';
import 'package:whatsappnew/Pages/homepagepersons.dart';
import 'package:whatsappnew/providers.dart';
import 'package:whatsappnew/Pages/updates.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController pgcontlr = PageController();
  String? title;

  @override
  Widget build(BuildContext context) {
    chatprovider provideer = Provider.of<chatprovider>(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (value) => provideer.onItemTapped(value),
        selectedIndex: provideer.selectedindex,
        destinations: const [
          NavigationDestination(
            icon: Badge(
              backgroundColor: Appcolors.Lightgreen,
              label: Text("2"),
              child: Icon(Icons.chat_bubble),
            ),
            label: "Chats",
          ),
          NavigationDestination(
              icon: Icon(Icons.sync_rounded), label: "Updates"),
          NavigationDestination(
            icon: Icon(Icons.groups_2_outlined),
            label: "Communities",
          ),
          NavigationDestination(
            icon: Icon(Icons.call_outlined),
            label: "Calls",
          )
        ],
      ),
      appBar: AppBar(
        leading: null,
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 0, 0, 0)),
        title: Text(
          provideer.title,
          style: const TextStyle(
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
            offset: const Offset(0, 50),
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
      body: PageView(
          scrollDirection: Axis.horizontal,
          controller: pgcontlr,
          children: [_buildBody()],
          onPageChanged: (index) => provideer.onItemTapped(index)),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Appcolors.Lightgreen,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return AddNewChats();
          }));
        },
        child: const Icon(
          Icons.message,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildBody() {
    chatprovider provideer = Provider.of<chatprovider>(context);
    switch (provideer.selectedindex) {
      case 0:
        return homepageChats();
      case 1:
        return statusPage();
      case 2:
        return const communities();
      case 3:
        return const callspage();
      default:
        return const Placeholder();
    }
  }
}
