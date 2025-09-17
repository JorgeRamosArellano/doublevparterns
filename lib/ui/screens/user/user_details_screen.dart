import 'package:double_v_partners_jorge_test/controllers/user/user_details_controller.dart';
import 'package:double_v_partners_jorge_test/utils/utils_colors.dart';
import 'package:double_v_partners_jorge_test/utils/utils_formaters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserDetailsScreen extends ConsumerStatefulWidget {

  static final route = 'user-details';

  final int? userId;

  const UserDetailsScreen({super.key, required this.userId});

  @override
  ConsumerState<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends ConsumerState<UserDetailsScreen> {

  late UserDetailsController controller;

  @override
  void initState() {
    controller = UserDetailsController(ref);
    controller.getUser(widget.userId);
    super.initState();
  }

@override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles (${controller.currentUser.id})'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: size.height * 0.03,
            children: [
        
              CircleAvatar(
                backgroundColor: UtilsColors.colorFromUserId(controller.currentUser.id),
                radius: size.width * 0.2,
                child: Icon(Icons.person, color: Colors.black, size: size.width * 0.15),
              ),
        
              TextFormField(
                initialValue: controller.currentUser.name,
                enabled: false,
                readOnly: true,
                decoration: InputDecoration(label: Text('Nombre de usuario')),
              ),

              TextFormField(
                initialValue: controller.currentUser.lastname,
                readOnly: true,
                enabled: false,
                decoration: InputDecoration(label: Text('Apellidos del usuario')),
              ),
        
              TextFormField(
                initialValue: UtilsFormaters.getDateFormatterByString(controller.currentUser.birth),
                readOnly: true,
                enabled: false,
                decoration: InputDecoration(label: Text('Fecha de naciomiento')),
              ),
        
              Align(
                alignment: AlignmentGeometry.centerLeft,
                child: Text('Su ubicación', style: TextStyle(fontWeight: FontWeight.bold))
              ),
        
              TextFormField(
                initialValue: 'Colombia 🇨🇴',
                enabled: false,
                readOnly: true,
              ),
        
              Row(
                spacing: 5,
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: controller.currentUser.location.state,
                      decoration: InputDecoration(label: Text('Estado/Dpto')),
                      enabled: false,
                      readOnly: true,
                    ),
                  ),
                  
                  Expanded(
                    child: TextFormField(
                      initialValue: controller.currentUser.location.city,
                      decoration: InputDecoration(label: Text('Ciudad')),
                      enabled: false,
                      readOnly: true,
                    ),
                  ),
                ],
              ),

              for (int i = 0; i < controller.currentUser.location.direction.length; i++)
              TextFormField(
                initialValue: controller.currentUser.location.direction[i],
                decoration: InputDecoration(label: Text('Dirección #${i+1}')),
                readOnly: true,
                enabled: false,
              ),
        
        
        
              FilledButton(
                onPressed: controller.onTapDeleteUser, 
                style: ButtonStyle(
                  minimumSize: WidgetStatePropertyAll(Size(size.width * 0.7, size.width * 0.13)),
                  backgroundColor: WidgetStatePropertyAll(const Color.fromARGB(255, 184, 12, 0)),
                ),
                child: Text('Eliminar usuario'),
              ),
        
              SizedBox(height: size.height * 0.1),
            ],
          ),
        ),
      ),
    );
  }
}