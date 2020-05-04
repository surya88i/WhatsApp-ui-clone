class User
{
  final String title;
  User({this.title});
  static List<User> getUsers(){
    return <User>[
      User(title:"New Group"),
      User(title:"New Broadcast"),
      User(title:"Labels"),
      User(title:"WhatsApp Web"),
      User(title:"Starred Message"),
      User(title:"Settings"),
    ];
  }
}
