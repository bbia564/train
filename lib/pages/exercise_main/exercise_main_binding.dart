import 'package:get/get.dart';

import 'exercise_main_logic.dart';

class ExerciseMainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExerciseMainLogic());
  }
}
