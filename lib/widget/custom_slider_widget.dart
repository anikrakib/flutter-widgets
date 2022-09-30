import 'dart:math';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget/model/data.dart';
import 'package:flutter_widget/widget/component/add_item_custom_list_tile.dart';
import 'package:flutter_widget/widget/component/post_item_custom_list_tile.dart';
import 'package:flutter_widget/widget/component/suggest_user_custom_list.dart';
import '../model/view_type.dart';

final List<ListItem> items = postList;
final faker = Faker();
final random = Random();

class ListViewWithMultipleViews extends StatelessWidget {
  const ListViewWithMultipleViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List View With Multiple View"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            if (item is AddItem) {
              return AddItemWidget(item: item);
            } else if (item is PostItem) {
              return PostItemWidget(postItem: item);
            } else if (item is SuggestUser) {
              return SuggestUserWidget(suggestUser: item.users);
            }
            return const ListTile(
              title: Text('Cant Find Anything'),
            );
          },
        ),
      ),
    );
  }
}
