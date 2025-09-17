import 'package:double_v_partners_jorge_test/ui/screens/dashboard/home_screen.dart';
import 'package:double_v_partners_jorge_test/ui/screens/index/index_screen.dart';
import 'package:double_v_partners_jorge_test/ui/screens/user/create_user_screen.dart';
import 'package:double_v_partners_jorge_test/ui/screens/user/user_details_screen.dart';
import 'package:go_router/go_router.dart';

//Index 
final _indexRoute = GoRoute(
  path: IndexScreen.route,
  builder: (context, state) => IndexScreen(),
);


//Arbol de navegación desde el HOME
final _homeRouteTree = GoRoute(
  path: HomeScreen.route,
  builder: (context, state) {
    return HomeScreen();
  },
  routes: [
    GoRoute(
      path: '${UserDetailsScreen.route}/:id',
      builder: (context, state) {
        final userIdData = int.tryParse(state.pathParameters['id']??'');
        return UserDetailsScreen(userId: userIdData);
      },
    ),
  ]
);


//Arbol de navegación para crear un usuario
final _creationRouteTree = GoRoute(
  path: CreateUserScreen.route,
  builder: (context, state) => CreateUserScreen(),
);



//ENRUTADOR PRINCIPAL
final routerTree = GoRouter(
  initialLocation: IndexScreen.route,
  routes: [
    _indexRoute,
    _homeRouteTree,
    _creationRouteTree,
  ] 
);