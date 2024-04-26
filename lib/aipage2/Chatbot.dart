import 'dart:convert';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as htpp;
import 'package:seustudyassist/aipage2/home_page.dart';

class Chatbot extends StatefulWidget {
  const Chatbot({super.key});

  @override
  State<Chatbot> createState() => _ChatbotState();
}

class _ChatbotState extends State<Chatbot> {
  ChatUser myself = ChatUser(id: '1', firstName: 'user');
  ChatUser bot =
      ChatUser(id: '2', firstName: 'seu', profileImage: 'assets/logo.png');

  List<ChatMessage> allmessages = [];
  List<ChatUser> typing = [];

  final oururl =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=AIzaSyBznkSAutAU5jPsUYA_hrrm1oY_WgzlzbA';
  final header = {'Content-Type': 'application/json'};

  getdata(ChatMessage m) async {
    typing.add(bot);
    allmessages.insert(0, m);
    setState(() {});

    var data = {
      "contents": [
        {
          "parts": [
            {"text": m.text}
          ]
        }
      ]
    };

    await htpp
        .post(Uri.parse(oururl), headers: header, body: jsonEncode(data))
        .then((value) {
      if (value.statusCode == 200) {
        var result = jsonDecode(value.body);
        print(result['candidates'][0]['content']['parts'][0]['text']);

        ChatMessage m1 = ChatMessage(
            text: result['candidates'][0]['content']['parts'][0]['text'],
            user: bot,
            createdAt: DateTime.now());
        allmessages.insert(0, m1);
      } else {
        print('error accured');
      }
    }).catchError((e) {});
    typing.remove(bot);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "SEU Study Assistant",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: 25.0),
        child: DashChat(
          typingUsers: typing,
          currentUser: myself,
          onSend: (ChatMessage m) {
            getdata(m);
          },
          messages: allmessages,
        ),
      ),
    );
  }
}
