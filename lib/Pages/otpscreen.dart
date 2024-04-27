import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whatsappnew/Pages/homepage.dart';
import 'package:whatsappnew/Utils/colors.dart';

class OTPScreen extends StatefulWidget {
  final String number;
  final String verificationID;
  const OTPScreen(
      {super.key, required this.number, required this.verificationID});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Varify Phone number",
          style: TextStyle(
              color: Appcolors.Tealgreen, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Otppage(),
    );
  }

  Widget Otppage() {
    return Column(
      children: [
        Center(
          child: Wrap(
            children: [
              const Text(
                "SMS sent to ",
                style: TextStyle(fontSize: 18),
              ),
              Text(
                "${widget.number}.",
                style:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              )
            ],
          ),
        ),
        Expanded(
          child: SizedBox(
            width: 70,
            child: Row(children: [
              Flexible(
                  child: TextField(
                controller: textEditingController,
                keyboardType: TextInputType.number,
                maxLength: 6,
                decoration: InputDecoration(),
              )),
            ]),
          ),
        ),
        ElevatedButton(
            onPressed: () async {
              try {
                PhoneAuthCredential credential =
                    await PhoneAuthProvider.credential(
                        verificationId: widget.verificationID,
                        smsCode: textEditingController.text.toString());
                FirebaseAuth.instance.signInWithCredential(credential).then(
                    (value) => Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => MainPage())));
              } catch (e) {
                Dialog(
                  child: Text("$e"),
                );
              }
            },
            child: const Text(""))
      ],
    );
  }
}
