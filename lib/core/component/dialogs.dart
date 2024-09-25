import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class Dialogs {

  static showErrorDialogs(context ,String desc){
    AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        animType: AnimType.topSlide,
        title: "Error",
        desc: desc,
        btnCancelOnPress: () {},
        btnOk: ElevatedButton(
          onPressed: () {},
          child: const Text("Retry"),
        )).show();
  }
}
