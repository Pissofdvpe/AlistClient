import 'package:alist/util/constant.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  final Rx<ThemeMode> themeMode = ThemeMode.system.obs;

  @override
  void onInit() {
    super.onInit();
    final saved = SpUtil.getInt(AlistConstant.themeMode) ?? 0;
    themeMode.value = ThemeMode.values[saved.clamp(0, 2)];
  }

  void setThemeMode(ThemeMode mode) {
    themeMode.value = mode;
    SpUtil.putInt(AlistConstant.themeMode, mode.index);
    Get.changeThemeMode(mode);
    // force rebuild
    Get.forceAppUpdate();
  }
}
