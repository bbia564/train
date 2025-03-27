import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'exercise_bind_logic.dart';

class ExerciseBindView extends GetView<PageLogic> {
  const ExerciseBindView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => controller.paucek.value
              ? const CircularProgressIndicator(color: Colors.green)
              : buildError(),
        ),
      ),
    );
  }

  Widget buildError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              controller.midjvq();
            },
            icon: const Icon(
              Icons.restart_alt,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}
