import 'package:flutter/material.dart';

RichText postBodyText(String? userName, {required String post}) {
  return RichText(
    text: TextSpan(
      text: '$userName ',
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
      children: [
        TextSpan(
          text: post.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.normal,
          ),
        )
      ],
    ),
  );
}
