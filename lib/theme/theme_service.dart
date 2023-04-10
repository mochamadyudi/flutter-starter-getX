import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:io' show Platform;

class ThemeService {
  final _box = GetStorage();
  final _key = 'isDarkMode';

  /// Get isDarkMode info from local storage and return themeMode
  ThemeMode get theme => loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  bool loadThemeFromBox()=> _box.read(_key) ?? false;

  _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);

  void switchTheme(){
    Get.changeThemeMode(loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);

    _saveThemeToBox(!loadThemeFromBox());

    Platform.isAndroid ? changeNavigationBarThemes(): "";
  }

  void changeNavigationBarThemes(){
    var checkTheme = loadThemeFromBox();

    Future.delayed(Duration(milliseconds: 200),(){
      if(checkTheme){
        SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.black
          )
        );
      }else{
        SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(
            systemNavigationBarColor: Colors.white
          )
        );
      }
    });
  }

}