import 'dart:html';

import 'package:chatapp_1/services/auth/auth_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'chat_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //instance of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //signuser out
  void signOut() {
    //get authservice
    final authService = Provider.of<AuthService>(context, listen: false);
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            onPressed: signOut,
            icon: const Icon(Icons.logout),
          ),
          
        ],
        
      ),
      body: _buildUserList(document),
    );
  }
    //build list of users except current login users
    Widget _buildUserList(DocumentSnapshot) {
      return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('error');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading....');
          }
          return ListView(
            children: snapshot.data!.docs
                .map<Widget>((doc) => _buildUserListItem(doc))
                .toList(),
          );
        },
      );
    }

    //build individual user item
    Widget _buildUserListItem(DocumentSnapshot document) {
      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

      //display all users except current user
      if (_auth.currentUser!.email != data['email']) {
        return ListTile(
          title: Text(data['email']),
          onTap: () {
            //pass the checked user's UID to next item
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChatPage(
                        receiverUserEmail: data['email'],
                        receiverUserID: data['uid'],
                      )),
            );
          },
        );
      } else {
        //return empty container
        return Container();
      }
    }
  }

