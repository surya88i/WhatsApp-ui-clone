class Status
{
  final String title;
  Status({this.title});
  static List<Status> getStatus(){
    return <Status>[
      Status(title:"Status Privacy"),
      Status(title:"Settings"),
    ];
  }
}