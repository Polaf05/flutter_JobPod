class Credentials {
  final String name;
  final String email;
  final String uid;
  final bool verified;

  Credentials({this.name, this.email, this.uid, this.verified});
}

class UserInfo extends Credentials {
  final String username;
  final String displayPicture;
  final String bio;
  
}
