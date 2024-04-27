import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whatsappnew/Pages/otpscreen.dart';
import 'package:whatsappnew/Utils/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _textEditingController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Enter your phone number",
          style: TextStyle(
              color: Appcolors.Tealgreen, fontWeight: FontWeight.w500),
        )),
      ),
      body: loginpageUI(),
    );
  }

  Widget loginpageUI() {
    return SafeArea(
        child: Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "WhatsApp will need to verify your phone number Carrier changes may apply.",
            style: TextStyle(fontSize: 15),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                controller: _textEditingController,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Appcolors.Tealgreen),
                  ),
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Appcolors.Tealgreen),
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => Appcolors.Tealgreen)),
              onPressed: () async {
                await FirebaseAuth.instance.verifyPhoneNumber(
                    verificationCompleted: ((phoneAuthCredential) {}),
                    verificationFailed: (FirebaseAuthException ex) {},
                    codeSent: ((String verificationId, int? resendtoken) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => OTPScreen(
                                number: _textEditingController.text.toString(),
                                verificationID: verificationId,
                              )));
                    }),
                    codeAutoRetrievalTimeout: (String verificationID) {},
                    phoneNumber: _textEditingController.text.toString());
              },
              child: const Text(
                "Next",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
              ))
        ],
      ),
    ));
  }
}
