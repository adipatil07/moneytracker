import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Customtextfield extends StatelessWidget {
  String? labelText;
  String? hintText;
  Customtextfield(this.labelText, this.hintText ,{super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        label: Text(labelText!),
        hintText: hintText
      ),
    );
  }
}
