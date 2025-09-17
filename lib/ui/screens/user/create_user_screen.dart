import 'package:flutter/material.dart';

class CreateUserScreen extends StatelessWidget {

  static final route = '/create-user';

  const CreateUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('CreateUserScreen'),),
    );
  }
}