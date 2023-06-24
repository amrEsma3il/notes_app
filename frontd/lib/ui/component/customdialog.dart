// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomToast extends StatefulWidget {
  String? message;

  CustomToast({
    Key? key,
    this.message,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CustomToastState();
  }

  void show(BuildContext context, String message) {
    showGeneralDialog(barrierColor:Colors.black45 ,
        context: context,
        pageBuilder: (ctx, a1, a2) {
          return CustomToast(message: message);
        },
        transitionBuilder: (ctx, a1, a2, child) {
          return SlideTransition(
              position:
                  Tween(begin: const Offset(0, -1), end: const Offset(0, 0)).animate(a1),
              child: child);
        },
        transitionDuration: const Duration(milliseconds: 700));
  }
}

class _CustomToastState extends State<CustomToast> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.only(top: kToolbarHeight),
      alignment: Alignment.topCenter,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(4.0)),
        child: Text(
          widget.message ?? "",
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(color: Colors.black),
        ),
      ),
    );
  }
}