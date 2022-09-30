import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../model/view_type.dart';

class SuggestUserWidget extends StatelessWidget {
  const SuggestUserWidget({Key? key, required this.suggestUser})
      : super(key: key);
  final List<User> suggestUser;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16.0, top: 16.0),
          child: Text(
            'Suggested User',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
        /*ListView.builder(
          itemCount: suggestUser.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return suggestUserCustomListTile(suggestUser[index]);
          },
        ),*/
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [for (var i in suggestUser) suggestUserCustomListTile(i)],
          ),
        )
      ],
    );
  }

  SizedBox suggestUserCustomListTile(User user) {
    //print("${user.userName}\n");
    return SizedBox(
      height: 250,
      width: 170,
      child: Card(
        color: Colors.brown,
        margin: const EdgeInsets.only(top: 15, left: 15, bottom: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 90,
                  width: 90,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundImage: NetworkImage(
                      user.userImage,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  user.userName,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 25,
                  width: 120,
                  child: ElevatedButton(
                    child: Text(
                      "Follow".toUpperCase(),
                      style: const TextStyle(fontSize: 12),
                    ),
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(
                        Colors.white,
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.blue,
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: const BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    onPressed: () => {},
                  ),
                )
              ],
            ),
            const Positioned(
              right: 5,
              top: 5,
              child: Icon(
                CupertinoIcons.multiply,
                size: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
