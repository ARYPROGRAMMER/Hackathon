import 'package:flutter/material.dart';


class StackedNotificationActions extends StatefulWidget {
  final AnimationController controller;
  final double padding;
  final double spacing;
  final Widget showLessAction;
  final Widget title;
  final Widget clearAllNotificationsAction;
  final VoidCallback clearAll;
  final int notificationCount;

  StackedNotificationActions({
    Key? key,
    required this.controller,
    required this.padding,
    required this.spacing,
    required this.title,
    required this.showLessAction,
    required this.clearAllNotificationsAction,
    required this.clearAll,
    required this.notificationCount,
  }) : super(key: key);

  @override
  State<StackedNotificationActions> createState() =>
      _StackedNotificationActionsState();
}

class _StackedNotificationActionsState
    extends State<StackedNotificationActions> {
  int clicked = 0;

  @override
  Widget build(BuildContext context) {
    final Animation<double> opacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: widget.controller,
        curve: Interval(0.4, 0.6),
      ),
    );

    return Padding(
      padding: EdgeInsets.fromLTRB(
        widget.padding,
        0,
        widget.padding,
        widget.spacing,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          widget.title,
          Expanded(
            child: SizedBox(),
          ),
          // showLess button
          GestureDetector(
            onTap: () {
              clicked = 0;
              widget.controller.reverse();
            },
            child: Visibility(
              visible: widget.notificationCount > 1,
              child: Opacity(
                opacity: opacity.value,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6,vertical: 3),
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.arrow_drop_up),
                      widget.showLessAction,
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          // clear all button
          GestureDetector(
            onTap: pressed,
            child: Visibility(
              visible: widget.notificationCount > 1,
              child: Opacity(
                opacity: opacity.value,
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 6,vertical: 3),
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(15)),
                    child: clicked == 1
                        ? Text(
                            "Clear",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          )
                        : widget.clearAllNotificationsAction),
              ),
            ),
          )
        ],
      ),
    );
  }

  void pressed() {
    if (clicked == 0) {
      setState(() {
        clicked = 1;
      });
    } else if (clicked == 1) {
      widget.clearAll();
      setState(() {
        clicked = 0;
      });
    } 
  }
}
