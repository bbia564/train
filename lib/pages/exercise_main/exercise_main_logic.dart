import 'package:exercise_together/db_exercise/db_exercise.dart';
import 'package:get/get.dart';

import '../../db_exercise/exercise_entity.dart';

class ExerciseMainLogic extends GetxController {

  DBExercise dbExercise = Get.find();

  var list = <ExerciseEntity>[].obs;

  void getData() async {
    list.value = await dbExercise.getExerciseAllData();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }


}
