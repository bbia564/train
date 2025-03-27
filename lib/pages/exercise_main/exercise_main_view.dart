import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:exercise_together/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'exercise_main_logic.dart';

class ExerciseMainPage extends StatefulWidget {
  const ExerciseMainPage({Key? key}) : super(key: key);

  @override
  State<ExerciseMainPage> createState() => _ExerciseMainPageState();
}

class _ExerciseMainPageState extends State<ExerciseMainPage> {
  ExerciseMainLogic controller = Get.find();

  void checkNetwork() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.none)) {
      Get.toNamed('/error_page');
    }
  }

  initState() {
    super.initState();
    checkNetwork();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: <Widget>[
        const SizedBox(
          width: double.infinity,
          height: double.infinity,
        ),
        Image.asset(
          'assets/bg.webp',
          width: double.infinity,
          height: 244,
          fit: BoxFit.cover,
        ),
        SafeArea(
            child: <Widget>[
          const Text(
            'Exercise together',
            style: TextStyle(
                fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),
          ).marginOnly(top: 30),
          const Text(
            '30 days to gain muscle and height',
            style: TextStyle(color: Colors.white),
          )
        ]
                .toColumn(crossAxisAlignment: CrossAxisAlignment.start)
                .marginSymmetric(horizontal: 15)),
        Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: <Widget>[
            Expanded(child: Obx(() {
              return ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: controller.list.value.length,
                  itemBuilder: (_, index) {
                    final entity = controller.list.value[index];
                    return Container(
                      width: double.infinity,
                      height: 62,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: <Widget>[
                        Text(
                          '${index + 1} day',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: entity.done ? primaryColor : Colors.black),
                        ),
                        entity.done
                            ? Icon(
                                Icons.check_circle_rounded,
                                size: 25,
                                color: primaryColor,
                              )
                            : const Icon(
                                Icons.keyboard_arrow_right,
                                size: 25,
                                color: Colors.grey,
                              ),
                      ].toRow(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween),
                    )
                        .decorated(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                color: entity.done
                                    ? primaryColor
                                    : const Color(0xffd5d5d5)),
                            color: entity.done
                                ? const Color(0xffdbfff0)
                                : const Color(0xfff8f8f8))
                        .marginOnly(bottom: 10).gestures(onTap: (){
                          if (!entity.done) {
                            Get.toNamed('/exercise_edit',arguments: entity)?.then((_) {
                              controller.getData();
                            });
                          }
                    });
                  });
            })),
            Container(
              width: double.infinity,
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              alignment: Alignment.center,
              child: <Widget>[
                <Widget>[
                  const Icon(
                    Icons.settings,
                    size: 25,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Setting',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ].toRow(),
                const Icon(
                  Icons.keyboard_arrow_right,
                  size: 25,
                  color: Colors.grey,
                )
              ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
            )
                .decorated(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xffd5d5d5)))
                .marginSymmetric(vertical: 10)
                .gestures(onTap: () {
                  Get.toNamed('/exerciseSetting')?.then((_) {
                    controller.getData();
                  });
            })
          ].toColumn(),
        )
            .decorated(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)))
            .marginOnly(top: 220)
      ].toStack(),
    );
  }
}
