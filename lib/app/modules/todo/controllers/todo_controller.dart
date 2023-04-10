import 'dart:convert';
import 'dart:core';

import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:yuyuid/app/models/todolist.model.dart';
import 'package:flutter/services.dart' as rootBndl;

class TodoController extends GetxController {
  //TODO: Implement TodoController
  var isLoading = true.obs;
  final data = [].obs;
  final count = 0.obs;

  Future<List<TodoListModel>>setLoading() async {
    final jsonData = await rootBndl.rootBundle.loadString('assets/json/todo.json');
    final list = json.decode(jsonData) as List<dynamic>;
    return list.map((e)=> TodoListModel.fromJson(e)).toList();
  }

  Future<void> getData() async {
    final jsonData = await rootBndl.rootBundle.loadString('assets/json/todo.json');
    final list = json.decode(jsonData) as List<dynamic>;
    list.map((e)=> TodoListModel.fromJson(e)).toList();
    data.value = setLoading() as List;
  }

  @override
  void onInit() {
    super.onInit();
    getData();
    // setLoading();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
