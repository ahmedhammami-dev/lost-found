import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Custominputdecoration extends StatelessWidget {
  String label, hint;
  Icon icon;
  Custominputdecoration(this.label, this.hint, this.icon, {super.key});
  GlobalKey<FormState> currentKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  InputDecoration customDecoration() {
    return InputDecoration(
      label: Text(label),
      hintText: hint,
      suffix: icon,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
    );
  }
}
