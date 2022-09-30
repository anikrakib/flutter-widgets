import 'package:flutter/material.dart';
import 'package:flutter_widget/widget/component/like_comment_bookmark_parts.dart';
import 'package:flutter_widget/widget/component/post_header.dart';
import 'package:flutter_widget/widget/component/post_body_text.dart';
import '../../model/view_type.dart';
import '../custom_slider_widget.dart';

class PostItemWidget extends StatelessWidget {
  const PostItemWidget({Key? key, required this.postItem}) : super(key: key);
  final PostItem postItem;

  @override
  Widget build(BuildContext context) {
    return postItemCustomListTile(postItem);
  }
}

SizedBox postItemCustomListTile(PostItem item) {
  return SizedBox(
    width: double.infinity,
    height: 550,
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
            bottom: 8.0,
            right: 5.0,
          ),
          child: postHeader(
            item.postUserName,
            false,
          ),
        ),
        Expanded(
          child: SizedBox(
            child: Image.network(
              item.postImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
        likeCommentBookmarkParts(),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(
            top: 8.0,
            left: 8.0,
          ),
          child: Text(
            '${random.nextInt(1000 + 100)} likes',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ),
        Visibility(
          visible: item.postBody?.isNotEmpty ?? false,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: postBodyText(
                item.postUserName,
                post: item.postBody.toString(),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
