import 'package:flutter/material.dart';

void snackPar(BuildContext context, String s) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(s)));
}