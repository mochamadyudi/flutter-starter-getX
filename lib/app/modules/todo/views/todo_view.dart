import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:yuyuid/shared/shared.dart';
import 'package:yuyuid/shared/widgets/popup/PopupWithButton.dart';
import 'package:yuyuid/theme/theme.dart';

import '../../../../widgets/todos/todo-item.widget.dart';
import '../controllers/todo_controller.dart';

class TodoView extends GetView<TodoController> {

  const TodoView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    print(controller.data.length);
    print(controller.data);
    return SafeArea(
      child: Scaffold(
          backgroundColor: hexToColor("#F7F7F7"),
          appBar: AppBar(
              backgroundColor: hexToColor('#FFFFFF'),
              elevation: .2,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu, color: hexToColor('#000000'), size: 20),
                  Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          color: hexToColor('#f0f0f0'),
                          borderRadius: BorderRadius.circular(30)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                      ))
                ],
              )),
          body: Container(
              child: SingleChildScrollView(
                  clipBehavior: Clip.hardEdge,
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                              color: hexToColor('#FFFFFF'),
                              borderRadius: BorderRadius.circular(50)
                            ),
                            child: const TextField(

                              style: TextStyle(color: AppTheme.nearlyBlack,fontWeight: FontWeight.w400),

                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(0),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: AppTheme.nearlyBlack,
                                  size:20,
                                ),
                                prefixIconConstraints: BoxConstraints(
                                  maxHeight: 20,
                                  minWidth: 40
                                ),
                                border: InputBorder.none,
                                hintText: "Search",

                              ),
                            ),
                          ),

                            Container(
                                child: ListView.builder(
                                    itemBuilder: (context, index){
                                      return Obx(()=> Text("Hallo ${controller.data.length}"));
                                    },
                                    itemCount: controller.data.length)
                            )
                          // Container(
                          // child: Obx(()=> ListView.builder(
                          //     itemCount: controller.data.length,
                          //     itemBuilder: (context, index) {
                          //       final data = controller.data[index];
                          //       return ListTile(
                          //         title: Text(data['id']),
                          //         subtitle: Text(data['title']),
                          //       );
                          //     },
                          // ))
                          // )

                        ],
                      )
                  )
              )
          )
      ),
    );
  }
}