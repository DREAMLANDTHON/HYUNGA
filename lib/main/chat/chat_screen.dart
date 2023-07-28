import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key, AnimationController? animationController}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _authentication = FirebaseAuth.instance;
  User? loggedUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _authentication.currentUser;
      if (user != null) {
        loggedUser = user;
        print(loggedUser!.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat screen'),
        actions: [
          IconButton(
            onPressed: () {
              _authentication.signOut();
            },
            icon: Icon(
              Icons.exit_to_app_sharp,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chats/X3CXq2d1bV6eM59jrql6/message')
            .snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {

          // 아직 데이터를 받아오는 중일 때는, 로딩화면이 뜨도록 설정한다.
          if(snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          // message 컬렉션 내에 있는 모든 문서(데이터)에 대해 접근한다.
          final docs = snapshot.data!.docs;
          return ListView.builder(
            // 데이터 개수
            itemCount: docs.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  docs[index]['text'],
                  style: TextStyle(fontSize: 20.0),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
