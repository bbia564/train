import 'package:exercise_together/db_exercise/db_exercise.dart';
import 'package:exercise_together/pages/exercise_bind/exercise_bind_binding.dart';
import 'package:exercise_together/pages/exercise_bind/exercise_bind_view.dart';
import 'package:exercise_together/pages/exercise_edit/exercise_edit_binding.dart';
import 'package:exercise_together/pages/exercise_edit/exercise_edit_view.dart';
import 'package:exercise_together/pages/exercise_edit/exercise_text_check.dart';
import 'package:exercise_together/pages/exercise_main/exercise_main_binding.dart';
import 'package:exercise_together/pages/exercise_main/exercise_main_view.dart';
import 'package:exercise_together/pages/exercise_setting/exercise_setting_binding.dart';
import 'package:exercise_together/pages/exercise_setting/exercise_setting_view.dart';
import 'package:exercise_together/pages/no_network/no_network_binding.dart';
import 'package:exercise_together/pages/no_network/no_network_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Color primaryColor = const Color(0xff47d89a);
Color bgColor = Colors.white;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => DBExercise().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Trains,
      initialRoute: '/',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}
List<GetPage<dynamic>> Trains = [
  GetPage(name: '/', page: () => const ExerciseBindView(), binding: ExerciseBindBinding()),
  GetPage(name: '/error_page', page: () => NoNetworkPage(), binding: NoNetworkBinding()),
  GetPage(name: '/exercise_main', page: () => const ExerciseMainPage(), binding: ExerciseMainBinding()),
  GetPage(name: '/exercise_check', page: () => const ExerciseTextCheck()),
  GetPage(name: '/exercise_edit', page: () => ExerciseEditPage(), binding: ExerciseEditBinding()),
  GetPage(name: '/exerciseSetting', page: () => const ExerciseSettingPage(), binding: ExerciseSettingBinding()),
];