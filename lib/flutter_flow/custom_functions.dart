import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';

String convertTo07Format(String phoneNumber) {
  RegExp regExp = RegExp(r'^[+0]?(\d)');

  // Find the first character
  String? firstChar = regExp.stringMatch(phoneNumber);

  if (firstChar != null) {
    // Replace the first character with '07'
    return '07' + phoneNumber.substring(firstChar.length);
  } else {
    // If no match is found, return the original number
    return phoneNumber;
  }
}

double fromStringToDoble(String value) {
  return double.parse(value);
}
