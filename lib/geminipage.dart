import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:ether_plex/pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:lottie/lottie.dart';

class Geminipage extends StatefulWidget {
  const Geminipage({super.key});

  @override
  State<Geminipage> createState() => _GeminipageState();
}

class _GeminipageState extends State<Geminipage> {
  final Gemini gemini = Gemini.instance;

  List<ChatMessage> messages = [];
  ChatUser currentUser = ChatUser(id: "0", firstName: "User");
  ChatUser geminiUser = ChatUser(
      id: "1",
      firstName: "Gemini",
      profileImage: "assets/images/google-gemini-icon.png");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Lottie.asset(
            'assets/animations/geminilottie.json',  // Path to your Lottie animation file
            height: 90,  // Adjust the height as needed
            width: 90,   // Adjust the width as needed
          ),
          centerTitle: true,
          backgroundColor: Color(0xFF181818),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/geminibackground.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: _BuildUI(),
        ));
  }

  Widget _BuildUI() {
    return DashChat(
      currentUser: currentUser,
      onSend: _sendMessage,
      messages: messages,
      messageOptions: MessageOptions(
        currentUserContainerColor: Pallete.mainFontColor,
        currentUserTextColor: Pallete.whiteColor,
        messagePadding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      ),
      inputOptions: InputOptions(
        inputDecoration: InputDecoration(
          hintText:
              "Type a message commrade...",
          hintStyle: TextStyle(color: Pallete.whiteColor,fontFamily: 'OCRA'),
          filled: true,
          fillColor: Pallete.mainFontColor,
          contentPadding: EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
                15.0),
            borderSide: BorderSide.none,
          ),
        ),
        inputToolbarPadding:
            EdgeInsets.all(10),
        inputToolbarMargin:
            EdgeInsets.all(5),
        inputMaxLines: 5,
      ),
    );
  }

  void _sendMessage(ChatMessage chatMessage) {
    setState(() {
      messages = [chatMessage, ...messages];
    });
    try {
      String question = chatMessage.text;
      gemini.streamGenerateContent(question).listen((event) {
        ChatMessage? lastMessage = messages.firstOrNull;
        if (lastMessage != null && lastMessage.user == geminiUser) {
          lastMessage = messages.removeAt(0);
          String response = event.content?.parts?.fold(
                  "", (previous, current) => "$previous ${current.text}") ??
              "";
          lastMessage.text += response;
          setState(
            () {
              messages = [lastMessage!, ...messages];
            },
          );
        } else {
          String response = event.content?.parts?.fold(
                  "", (previous, current) => "$previous ${current.text}") ??
              "";
          ChatMessage message = ChatMessage(
              user: geminiUser, createdAt: DateTime.now(), text: response);
          setState(() {
            messages = [message, ...messages];
          });
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
