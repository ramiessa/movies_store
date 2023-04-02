import 'package:flutter/material.dart';
import 'package:movies_store/shared/styles/colors.dart';

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

Widget defualtContainer({
  required String text,
}) {
  return Container(
    width: 150,
    height: 150,
    decoration: BoxDecoration(
      color: Colors.grey[300],
      borderRadius: BorderRadius.circular(13),
    ),
    child: Center(
      child: Text(
        text,
        style: const TextStyle(
            color: defaultColor, fontSize: 17, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget defualtSearchBox() {
  return Container(
    decoration: BoxDecoration(
      color: Colors.grey[300],
      borderRadius: BorderRadius.circular(15),
    ),
    child: Row(
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Icon(
            Icons.search,
            color: Colors.grey,
          ),
        ),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    ),
  );
}
