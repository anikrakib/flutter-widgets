abstract class ListItem {}

class AddItem implements ListItem {
  final String addName;
  final String addImage;
  String? addPost;

  AddItem({
    this.addPost,
    required this.addName,
    required this.addImage,
  });
}

class PostItem implements ListItem {
  final String postUserName;
  final String postImage;
  String? postBody;

  PostItem({
    this.postBody,
    required this.postUserName,
    required this.postImage,
  });
}

class SuggestUser implements ListItem {
  final List<User> users;

  SuggestUser({required this.users});
}

class User {
  final String userName;
  final String userImage;

  User({
    required this.userName,
    required this.userImage,
  });
}
