import 'package:double_v_partners_jorge_test/routes/routes_three.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'routes_provider.g.dart';

@riverpod 
GoRouter goRouter(Ref ref){
  return routerTree;
}