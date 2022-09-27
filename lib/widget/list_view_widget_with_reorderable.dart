import 'package:flutter/material.dart';
import 'package:flutter_widget/data/user.dart';

class ListViewWidgetWithReOrderAble extends StatefulWidget {
  const ListViewWidgetWithReOrderAble({Key? key}) : super(key: key);

  @override
  State<ListViewWidgetWithReOrderAble> createState() =>
      _ListViewWidgetWithReOrderAbleState();
}

class _ListViewWidgetWithReOrderAbleState
    extends State<ListViewWidgetWithReOrderAble> {
  List allUsers = getUsers();

  @override
  void initState() {
    super.initState();
    allUsers = getUsers();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Reorder List View'),
          centerTitle: true,
          backgroundColor: Colors.purple,
          elevation: 20,
        ),
        body: SafeArea(
          child: ReorderableListView(
            onReorder: (oldIndex, newIndex) => setState(() {
              final index = newIndex > oldIndex ? newIndex - 1 : newIndex;

              final user = allUsers.removeAt(oldIndex);
              allUsers.insert(index, user);
            }),
            children: [
              for (final user in allUsers)
                Padding(
                  key: ValueKey(user),
                  padding: const EdgeInsets.only(top: 8.0),
                  child: ListTile(
                    title: Text(
                      user.name,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    leading: SizedBox(
                      height: 60,
                      width: 80,
                      child: CircleAvatar(
                        //radius: 10,
                        backgroundImage: NetworkImage(user.urlImage),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
}
