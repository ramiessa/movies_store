import 'package:flutter/material.dart';

class WatchList extends StatelessWidget {
  const WatchList({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      top: true,
      child: Scaffold(
        body: Text('WatchList'),
      ),
    );
  }
}
