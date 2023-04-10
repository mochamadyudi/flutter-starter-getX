import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yuyuid/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.TODO);
                  },
                  child: Text('Todo App'))
            ],
          ),
        ),
      ),
    );
  }
}
