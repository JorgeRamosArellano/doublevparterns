import 'package:double_v_partners_jorge_test/models/user/user.dart';
import 'package:double_v_partners_jorge_test/providers/routes/routes_provider.dart';
import 'package:double_v_partners_jorge_test/providers/users/users_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserDetailsController {

  final WidgetRef _ref;
  late final User currentUser;

  UserDetailsController(this._ref);

  void getUser(int? userId){
    if(userId == null){
      _ref.read(goRouterProvider).pop();
      return;
    }
    currentUser = _ref.read(usersProvider).firstWhere((user) => user.id == userId);
  }

  void onTapDeleteUser(){
    _ref.read(usersProvider.notifier).removeUser(currentUser);
    _ref.read(goRouterProvider).pop();
  }

}