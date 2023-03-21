import 'package:flutter/material.dart';

InputDecoration buildInputDecoration(String hinttext) {
  return InputDecoration(
    hintText: hinttext,
    hintStyle: const TextStyle(color: Color.fromARGB(85, 158, 158, 158)),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(color: Colors.grey, width: 1.5),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14.0),
      borderSide: const BorderSide(
        color: Colors.white,
        width: 1.5,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(
        color: Colors.white,
        width: 1.5,
      ),
    ),
  );
}
