import 'dart:ui';
import 'package:flutter/material.dart';

class WarnaHex extends Color {
  static int _ambilWarnaDariHex(String warnaHex) {
    warnaHex = warnaHex.toUpperCase().replaceAll("#", "");
    if (warnaHex.length == 6) {
      warnaHex == "FF" + warnaHex;
    }
    return int.parse(warnaHex, radix: 16);
  }

  WarnaHex(final String warnaHex) : super(_ambilWarnaDariHex(warnaHex));
}
