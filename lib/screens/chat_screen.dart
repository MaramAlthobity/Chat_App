import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/chat/messages.dart';
import '../widgets/chat/new_messages.dart';

class ChatScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Chat'),
        actions: [
          DropdownButton(
              underline: Container(),
              icon: Icon(
                Icons.more_vert,
                color: Theme.of(context).primaryIconTheme.color,
              ),
              items: [
                DropdownMenuItem(
                  child: Row(
                    children: [
                      Icon(Icons.exit_to_app, color: Colors.black),
                      SizedBox(width: 8),
                      Text('Logout', style: TextStyle(color: Colors.black)),
                    ],
                  ),
                  value: 'logout',
                ),
              ],
              onChanged: (itemIdentifier) {
                if (itemIdentifier == 'logout') {
                  FirebaseAuth.instance.signOut();
                }
              })
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: Messages(),
            ),
            NewMessages(),
          ],
        ),
      ),
    );
  }
}

