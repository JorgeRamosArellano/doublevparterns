
import 'package:double_v_partners_jorge_test/models/user/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'users_provider.g.dart';

@Riverpod(keepAlive: true)
class Users extends _$Users {

  @override
  List<User> build () => [];

  void addUser(User newUser){
    state.add(newUser);
    state = List.from(state);
  }

  void removeUser(User removeUser){
    state.remove(removeUser);
    state = List.from(state);
  }
  
}