import 'package:ether_plex/pallete.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Etherplex',style: TextStyle(fontFamily: 'Etherplex',color: Pallete.textcolor),),
        centerTitle: true,
        leading: Icon(Icons.menu,color: Pallete.textcolor,),
      ),
      body: Column(
        children: [
          Center(child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container
              ( height:150 ,
                width:150 ,
                child: Image.asset('assets/images/Etherplexchatbot.png',)),
          )),
        ],
      ),
    );
  }
}
