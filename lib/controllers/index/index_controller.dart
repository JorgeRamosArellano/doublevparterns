import 'package:double_v_partners_jorge_test/providers/routes/routes_provider.dart';
import 'package:double_v_partners_jorge_test/ui/screens/dashboard/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IndexController {

  final WidgetRef _ref;

  IndexController({required WidgetRef ref}) : _ref = ref;

  void onTapStart(){
    _ref.read(goRouterProvider).push(HomeScreen.route);
  }


}