import 'package:flutter/material.dart';

class UserDetailsScreen extends StatelessWidget {

  static final route = 'user-details';

  final int? userId;

  const UserDetailsScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('UserDetailsScreen:userId:$userId'),),
    );
  }
}