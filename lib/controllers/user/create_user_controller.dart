// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:double_v_partners_jorge_test/models/user/user.dart';
import 'package:double_v_partners_jorge_test/providers/routes/routes_provider.dart';
import 'package:double_v_partners_jorge_test/providers/users/users_provider.dart';
import 'package:double_v_partners_jorge_test/utils/utils_formaters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateUserController {


  final WidgetRef _ref;
  late GlobalKey<FormState> createUserFormState;

  User newUser = User.empty();

  TextEditingController userName = TextEditingController();
  TextEditingController userLastname = TextEditingController();
  TextEditingController userBirth = TextEditingController();

  final Map<String, List<String>> colombia = {
    "Antioquia": [
      "Medellín",
      "Bello",
      "Envigado",
      "Itagüí",
      "Rionegro",
    ],
    "Cundinamarca": [
      "Bogotá",
      "Soacha",
      "Zipaquirá",
      "Girardot",
      "Fusagasugá",
    ],
    "Atlántico": [
      "Barranquilla",
      "Soledad",
      "Malambo",
      "Puerto Colombia",
      "Sabanalarga",
    ],
    "Magdalena": [
      "Santa Marta",
      "Ciénaga",
      "Fundación",
      "Aracataca",
      "El Banco",
    ],
  };

  //Location
  List<TextEditingController> userDirections = [TextEditingController()];




  CreateUserController(this._ref);




  void onTapShowDatePicker() async{
    final DateTime? dateSelected = await showDatePicker(
      context: _ref.context,
      initialDate: newUser.birth.isEmpty ? DateTime.now() : DateTime.parse(newUser.birth),
      firstDate: DateTime(1970),
      lastDate: DateTime.now(),
    );
    if(dateSelected == null) return;
    newUser.birth = dateSelected.toString();
    userBirth.text = UtilsFormaters.getDateFormatterByString(newUser.birth);
  }


  void onTapAddNewDirection(){
    userDirections.add(TextEditingController());
  }

  void validateCreateUserForm(){

    if(!createUserFormState.currentState!.validate()) return;

    //Formulario OK
    newUser.id = generateUserId();
    newUser.name = userName.text;
    newUser.lastname = userLastname.text;
    newUser.location.country = 'Colombia';
    newUser.location.direction = userDirections.map((d) => d.text).toList();

    _ref.read(usersProvider.notifier).addUser(newUser);

    _ref.read(goRouterProvider).pop();

  }

  int generateUserId(){
    return Random().nextInt(255);
  }

  void cleaner(){
    userBirth.dispose();
    userLastname.dispose();
    userName.dispose();
    for (var controller in userDirections) {
      controller.dispose();
    }
  }



}
