import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget/model/view_type.dart';
import 'package:flutter_widget/widget/component/like_comment_bookmark_parts.dart';
import 'package:flutter_widget/widget/component/post_header.dart';
import 'package:flutter_widget/widget/component/post_body_text.dart';
import 'package:palette_generator/palette_generator.dart';
import '../custom_slider_widget.dart';

PaletteColor? bgColor;

class AddItemWidget extends StatefulWidget {
  const AddItemWidget({Key? key, required this.item}) : super(key: key);
  final AddItem item;

  @override
  State<AddItemWidget> createState() => _AddItemWidgetState();
}

class _AddItemWidgetState extends State<AddItemWidget> {
  @override
  void initState() {
    super.initState();
    _updatePalette();
  }
  _updatePalette() async {
    PaletteGenerator palette = await PaletteGenerator.fromImageProvider(
      NetworkImage(widget.item.addImage),
      size: const Size(200, 100),
    );
    palette.darkMutedColor != null
        ? bgColor = palette.darkMutedColor
        : bgColor = PaletteColor(Colors.red, 3);

    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return addItemCustomListTile(widget.item);
  }
}

SizedBox addItemCustomListTile(AddItem item) {
  return SizedBox(
    width: double.infinity,
    height: 500,
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
            bottom: 8.0,
            right: 5.0,
          ),
          child: postHeader(item.addName, true),
        ),
        Expanded(
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Image.network(
                  item.addImage,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: -1,
                right: -1,
                left: -1,
                child: Container(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  width: double.infinity,
                  height: 45,
                  color: bgColor?.color,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Learn More',
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        CupertinoIcons.forward,
                        color: Colors.white,
                        size: 18,
                      )
                    ],
                  ),
                ),
              )
            ],
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
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
        Visibility(
          visible: item.addPost?.isNotEmpty ?? false,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: postBodyText(
                item.addName,
                post: item.addPost.toString(),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

