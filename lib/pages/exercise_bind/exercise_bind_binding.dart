import 'package:get/get.dart';

import 'exercise_bind_logic.dart';

class ExerciseBindBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
