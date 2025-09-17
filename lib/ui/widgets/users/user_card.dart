import 'package:double_v_partners_jorge_test/models/user/user.dart';
import 'package:double_v_partners_jorge_test/utils/utils_colors.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final User user;
  final void Function() onTapCard;
  const UserCard({super.key, required this.user, required this.onTapCard});



  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: UtilsColors.colorFromUserId(user.id),
          child: Icon(Icons.person, color: Colors.black),
        ),
        title: Text(
          '${user.name} ${user.lastname}',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(user.location.city),
        trailing: Icon(Icons.arrow_forward_ios_rounded),
        onTap: onTapCard,
      ),
    );
  }
}