import 'package:flutter/material.dart';
import 'package:postsapp/Core/apptext/apptext.dart';

class MessageDisplay extends StatelessWidget {
  const MessageDisplay({Key? key, required this.Message}) : super(key: key);
final String Message;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/3,
      child: Center(
        child: SingleChildScrollView(
          child: Center(child: AppText(text: Message,size: 25,)),
        ),
      ),
    );
  }
}
