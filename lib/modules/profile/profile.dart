import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      top: true,
      child: Scaffold(
        body: Text('Profile'),
      ),
    );
  }
}
