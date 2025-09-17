import 'package:double_v_partners_jorge_test/controllers/dashboard/home_controller.dart';
import 'package:double_v_partners_jorge_test/providers/users/users_provider.dart';
import 'package:double_v_partners_jorge_test/ui/widgets/users/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {

  static final route = '/home';

  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

  late HomeController controller;

  @override
  void initState() {
    controller = HomeController(ref);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    ref.watch(usersProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Mis usuarios'),
        backgroundColor: const Color.fromARGB(166, 245, 187, 255),
      ),
      body: ref.read(usersProvider).isEmpty
      ? Center(
        child: TextButton(
          onPressed: controller.goToCreateUser, 
          child: RichText(
            text: TextSpan(
              text: 'Aún no tienes usuarios. ',
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: 'Crea el primero aquí',
                  style: TextStyle(decoration: TextDecoration.underline)
                )
              ]
            ),
          ),
        ),
      )
      : ListView.separated(
        padding: const EdgeInsets.all(10),
        itemCount: ref.read(usersProvider).length,
        itemBuilder: (context, index) {
          return UserCard(
            user: ref.read(usersProvider)[index],
            onTapCard: () => controller.goToUserDetailsPage(ref.read(usersProvider)[index].id),
          );
        }, 
        separatorBuilder: (context, index) {
          return SizedBox(height: 10);
        }, 
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.goToCreateUser,
        child: Icon(Icons.person_add_alt_1),
      ),
    );
  }
}