import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

class PopupWithButton extends StatefulWidget {
  final Widget child;

  PopupWithButton({Key? key, required this.child}) : super(key: key);

  @override
  _PopupWithButton createState() => _PopupWithButton();
}

class _PopupWithButton extends State<PopupWithButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: widget.child,
      onTap: _showPopupMenu,
    );
  }

  void _showPopupMenu() {
    RenderBox renderBox = (widget.child.key as GlobalKey)
        .currentContext
        ?.findRenderObject() as RenderBox;
    Offset position = renderBox.localToGlobal(Offset.zero);

    showCupertinoDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return PopupMenuContent(
              position: position,
              size: renderBox.size,
              onAction: (x) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: Duration(seconds: 1),
                      content: Text('Action => $x'),
                    )
                );
              });
        });
  }
}

class PopupMenuContent extends StatefulWidget{
  final Offset position;
  final Size size;
  final ValueChanged<String>? onAction;

  const PopupMenuContent({Key? key, required this.position, required this.size, this.onAction}) : super(key: key);

  @override
  _PopupMenuContentState createState() => _PopupMenuContentState();
}

class _PopupMenuContentState extends State<PopupMenuContent> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState(){
    _animationController = AnimationController(vsync: this,duration:Duration(milliseconds: 200));
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeOut));
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _animationController.forward();
    });
  }

  @override
  void dispose(){
    _animationController.dispose();
    super.dispose();
  }

  void _closePopup(String action) {
    _animationController.reverse().whenComplete((){
      Navigator.of(context).pop();

      if(action.isNotEmpty) widget.onAction?.call(action);
    });
  }


  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: ()async{
        _closePopup("");
        return false;
      },
      child: GestureDetector(
        onTap: ()=> _closePopup(""),
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            height: double.maxFinite,
            width: size.width,
            color: Colors.transparent,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right:  0,
                  top: widget.position.dy,
                  child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child){
                      return Transform.scale(
                        scale: _animation.value,
                        alignment: Alignment.topLeft,
                        child: Opacity(opacity: _animation.value,child: child),
                      );
                    },
                    child: GestureDetector(
                      onTap: (){},
                      child: Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.symmetric(horizontal: 24,vertical: 24),
                        margin: EdgeInsets.only(left: 0 ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(.1),
                                blurRadius: 8,
                              )
                            ]
                        ),
                        child: Column(
                          children: [
                            //Repeat now
                            GestureDetector(
                              onTap: ()=> _closePopup("repeatNow"),
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFFF0E3),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: Icon(Icons.repeat, color: Colors.red,),
                                  ),
                                  SizedBox(width: 12,),
                                  Text(
                                    "Repeat Now",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(.7),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //Edit workout
                            SizedBox(height: 16,),

                            GestureDetector(
                              onTap: ()=> _closePopup("editWorkout"),
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFE1E1FC),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: Icon(Icons.edit, color: Color(0xFF3840A2),),
                                  ),
                                  SizedBox(width: 12,),
                                  Text(
                                    "Edit Workout",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(.7),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //Share workout
                            SizedBox(height: 16,),

                            GestureDetector(
                              onTap: ()=> _closePopup("ShareNow"),
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFDDF3FD),
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: Icon(Icons.share, color:Color(0xFF0586C0),),
                                  ),
                                  SizedBox(width: 12,),
                                  Text(
                                    "Share Now",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(.7),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}