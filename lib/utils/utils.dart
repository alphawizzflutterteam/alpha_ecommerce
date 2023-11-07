import 'package:alpha_ecommerce_18oct/utils/color.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{

 static toastMessage(String msg){
    Fluttertoast.showToast(msg: msg);
  }

  static showFlushBarWithMessage(String title,String msg,BuildContext context){
      Flushbar(
            title: title,
            forwardAnimationCurve: Curves.decelerate,
            margin:const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            padding: const EdgeInsets.all(10),
            backgroundColor: colors.deliveredLight,
            flushbarPosition: FlushbarPosition.TOP,
            reverseAnimationCurve: Curves.bounceInOut,
            positionOffset: 20,
            message:msg,
            duration: const Duration(seconds: 3),
          ).show(context);
  }
}