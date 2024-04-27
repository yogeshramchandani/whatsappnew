import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whatsappnew/Utils/colors.dart';

class AddNewContactsPage extends StatefulWidget {
  const AddNewContactsPage({super.key});

  @override
  State<AddNewContactsPage> createState() => _AddNewContactsPageState();
}

class _AddNewContactsPageState extends State<AddNewContactsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New contact"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: const Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.person_outline,
                  size: 30,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    cursorColor: Appcolors.Lightgreen,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Appcolors.Lightgreen),
                        ),
                        floatingLabelStyle:
                            TextStyle(color: Appcolors.Lightgreen),
                        labelText: "First name"),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: TextField(
                    cursorColor: Appcolors.Lightgreen,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Appcolors.Lightgreen),
                        ),
                        floatingLabelStyle:
                            TextStyle(color: Appcolors.Lightgreen),
                        labelText: 'Last name'),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.phone_outlined,
                  size: 30,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: TextField(
                    cursorColor: Appcolors.Lightgreen,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Appcolors.Lightgreen),
                      ),
                      floatingLabelStyle:
                          TextStyle(color: Appcolors.Lightgreen),
                      labelText: "Phone",
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 40,
        child: FloatingActionButton(
          backgroundColor: Appcolors.Lightgreen,
          onPressed: () {},
          child: Text(
            "Save",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
