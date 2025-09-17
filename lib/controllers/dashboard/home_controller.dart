import 'package:double_v_partners_jorge_test/providers/routes/routes_provider.dart';
import 'package:double_v_partners_jorge_test/ui/screens/dashboard/home_screen.dart';
import 'package:double_v_partners_jorge_test/ui/screens/user/create_user_screen.dart';
import 'package:double_v_partners_jorge_test/ui/screens/user/user_details_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeController {
  final WidgetRef _ref;

  HomeController(this._ref);



  void goToUserDetailsPage(int userId){
    _ref.read(goRouterProvider).push('${HomeScreen.route}/${UserDetailsScreen.route}/$userId');
  }

  void goToCreateUser(){
    _ref.read(goRouterProvider).push(CreateUserScreen.route);
  }




}