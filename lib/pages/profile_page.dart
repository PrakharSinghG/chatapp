import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final currentUser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Profile"),
        ),
        body: ListView(
          children: [
            const SizedBox(height: 50),
            const Icon(
              Icons.person,
              size: 70,
            ),
            const SizedBox(height: 50),
            Text(
              currentUser.email!,
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }
}
