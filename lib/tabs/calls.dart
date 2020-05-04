class Calls
{
  final String title;
  Calls({this.title});
  static List<Calls> getCalls(){
    return <Calls>[
      Calls(title:"Clear Logs"),
      Calls(title:"Settings"),
    ];
  }
}