import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, ${FirebaseAuth.instance.currentUser?.email}'),
      ),
      body: Container(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
