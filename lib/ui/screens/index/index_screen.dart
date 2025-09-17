import 'package:double_v_partners_jorge_test/controllers/index/index_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IndexScreen extends ConsumerStatefulWidget {

  static final route = '/';

  const IndexScreen({super.key});

  @override
  ConsumerState<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends ConsumerState<IndexScreen> {

  late IndexController controller;

  @override
  void initState() {
    controller = IndexController(ref: ref);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: size.height * 0.1,
          children: [
            Text('DoubleVPartners Test - Jorge Ramos Arellano'),
            FilledButton.icon(
              label: Text('Comenzar'),
              icon: Icon(Icons.keyboard_arrow_right_rounded),
              onPressed: controller.onTapStart,
            ),
          ],
        ),
      ),
    );
  }
}

