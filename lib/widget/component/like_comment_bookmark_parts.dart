import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Padding likeCommentBookmarkParts() {
  return Padding(
    padding: const EdgeInsets.only(
      left: 8.0,
      right: 8.0,
      top: 8.0,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: const [
            Icon(
              CupertinoIcons.heart,
              color: Colors.white,
              size: 20,
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              CupertinoIcons.chat_bubble,
              color: Colors.white,
              size: 20,
            ),
          ],
        ),
        const Icon(
          CupertinoIcons.bookmark,
          color: Colors.white,
          size: 20,
        ),
      ],
    ),
  );
}