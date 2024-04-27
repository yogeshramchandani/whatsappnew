import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatMessage extends StatefulWidget {
  final String text;
  final int index;

  ChatMessage({Key? key, required this.text, required this.index})
      : super(key: key);

  @override
  State<ChatMessage> createState() => _ChatMessageState();
}

class _ChatMessageState extends State<ChatMessage> {
  DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 119, 235, 163),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Flexible(
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.6,
                  ),
                  padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
                  margin: const EdgeInsets.only(top: 5),
                  child: Text(
                    widget.text,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${_dateTime.hour}:${_dateTime.minute}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const Icon(Icons.check),
                ],
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
