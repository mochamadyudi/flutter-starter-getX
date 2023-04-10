// import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yuyuid/shared/widgets/popup/PopupWithButton.dart';
import 'package:yuyuid/theme/app_theme.dart';

class TodoItemWidget extends StatefulWidget{

  final num? id;
  final String? title, description;
  final bool? status;
  final EdgeInsets? margin;

  const TodoItemWidget({Key? key,
    this.status,
    this.id,
    this.margin,
    this.title,
    this.description
  }):super(key: key);

  @override
  _TodoItemWidget createState()=> _TodoItemWidget();
}
class _TodoItemWidget extends State<TodoItemWidget> {
  // final num? id;
  // final String? title, description;
  // final bool? status;
  // final EdgeInsets? margin;
  //
  // _TodoItemWidget({Key? key,
  //   this.status,
  //   this.id,
  //   this.margin,
  //   this.title,
  //   this.description
  // });

  void _listTapper(){
    print('List Tapped');
  }

  void _delete(){
    print("Button delete tapped");
  }

  @override
  Widget build(BuildContext context) {
    bool isDone = widget.status ?? false;
    Size size = MediaQuery.of(context).size;
    final ColorScheme colors = Theme.of(context).colorScheme;

    return PopupWithButton(
      child: ListTile(
        key: GlobalKey(),
        // onTap: _listTapper,
          tileColor: AppTheme.white,
          leading: Icon(
            isDone ? Icons.check_box : Icons.check_box_outline_blank,
            color: AppTheme.thinOrange,
            size: 25,
          ),
          title: Text('${widget.title}',
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  color: AppTheme.grey,
                  decoration: widget.status == true ? TextDecoration.lineThrough : TextDecoration.none
              )
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          trailing: PopupWithButton(
              child: Icon(Icons.delete,size: 16)
            // CircleAvatar(
            //     radius:15,
            //     backgroundColor: AppTheme.danger,
            //     child:IconButton(
            //       splashRadius: 25,
            //       style: IconButton.styleFrom(
            //         animationDuration: Duration(milliseconds: 2000),
            //       ),
            //       alignment: Alignment.center,
            //       padding: EdgeInsets.zero,
            //       splashColor: Colors.pink,
            //       // highlightColor: AppTheme.danger.withOpacity(.2),
            //       highlightColor: Colors.transparent,
            //       color: AppTheme.white,
            //       // iconSize: 16,
            //       icon: Icon(Icons.delete,size: 16),
            //       onPressed: _delete,
            //     )
            // ),
          )
      ),
    );
  }
}
