import 'package:double_v_partners_jorge_test/controllers/user/create_user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateUserScreen extends ConsumerStatefulWidget {

  static final route = '/create-user';

  const CreateUserScreen({super.key});

  @override
  ConsumerState<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends ConsumerState<CreateUserScreen> {

  late CreateUserController controller;
  @override
  void initState() {
    controller = CreateUserController(ref);
    controller.createUserFormState = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear usuario'),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          key: controller.createUserFormState,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: size.height * 0.03,
              children: [

                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/men-create-user.png'),
                  radius: size.width * 0.2,
                ),

                TextFormField(
                  controller: controller.userName,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(label: Text('Nombre de usuario')),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => (value??'').trim().isEmpty ? 'Este campo no puede estar vacío' : null,
                ),

                TextFormField(
                  controller: controller.userLastname,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(label: Text('Apellidos del usuario')),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => (value??'').trim().isEmpty ? 'Este campo no puede estar vacío' : null,
                ),
                

                TextFormField(
                  controller: controller.userBirth,
                  readOnly: true,
                  decoration: InputDecoration(label: Text('Fecha de naciomiento')),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => (value??'').trim().isEmpty ? 'Este campo no puede estar vacío' : null,
                  onTap: controller.onTapShowDatePicker,
                ),

                Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Text('Tu ubicación', style: TextStyle(fontWeight: FontWeight.bold))
                ),

                TextFormField(
                  initialValue: 'Colombia 🇨🇴',
                  readOnly: true,
                  enabled: false,
                ),

                Row(
                  spacing: 5,
                  children: [
                    Expanded(
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(label: Text('Estado/Dpto')),
                        items: controller.colombia.keys.map(
                          (state) => DropdownMenuItem(
                            value: state,
                            child: Text(state),
                          ),
                        ).toList(), 
                        onChanged: (item){
                          controller.newUser.location.state = item ?? '';
                          controller.newUser.location.city = controller.colombia[item]!.first;
                          setState(() {});
                        },
                        validator: (value) => (value??'').isEmpty ? 'Selecciona un dpto' : null,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                    ),
                    
                    Expanded(
                      child: DropdownButtonFormField(
                        initialValue: controller.newUser.location.city.isEmpty ? null : controller.newUser.location.city,
                        decoration: InputDecoration(label: Text('Ciudad')),
                        items: controller.newUser.location.state.isEmpty 
                        ? [ DropdownMenuItem(value: '', child: Text('')) ] 
                        : controller.colombia[controller.newUser.location.state]!.map(
                          (city) => DropdownMenuItem(
                            value: city,
                            child: Text(city),
                          ),
                        ).toList(), 
                        onChanged: (item) => controller.newUser.location.city = item ?? '',
                        validator: (value) => (value??'').isEmpty ? 'Selecciona una ciudad' : null,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                    ),
                  ],
                ),

                TextFormField(
                  controller: controller.userDirection,
                  decoration: InputDecoration(label: Text('Dirección')),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => (value??'').trim().isEmpty ? 'Este campo no puede estar vacío' : null,
                ),


                FilledButton(
                  onPressed: controller.validateCreateUserForm, 
                  style: ButtonStyle(
                    minimumSize: WidgetStatePropertyAll(Size(size.width * 0.7, size.width * 0.1))
                  ),
                  child: Text('Crear'),
                ),

                SizedBox(height: size.height * 0.1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}