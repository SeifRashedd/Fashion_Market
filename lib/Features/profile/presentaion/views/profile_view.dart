import 'package:fashion_market/Features/profile/presentaion/views/widgets/profile_view_body.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    String email = user?.email ?? 'No email';
    String username = user?.displayName ?? 'No username';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ProfileViewBody(username: username, email: email),
    );
  }
}

