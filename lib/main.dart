import 'package:flutter/material.dart';

void main() => runApp(const FlutterApp());

class FlutterApp extends StatefulWidget {
  const FlutterApp({Key? key}) : super(key: key);

  @override
  _FlutterAppState createState() => _FlutterAppState();
}

class _FlutterAppState extends State<FlutterApp> {
  var lists = List<String>.generate(11, (index) => "List:$index");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('SnackBar Widget'),
        ),
        body: ListView.builder(
          itemCount: lists.length,
          itemBuilder: (context, index){
            return ListTile(
              title: Text(lists[index]),
              trailing: Container(
                width: 60,
                child: FlatButton(
                  child: const Icon(Icons.delete, color: Colors.grey,),
                  onPressed: (){
                    showSnackBar(context, index);
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context, int index){
    var deleteRecord = lists[index];
    setState((){
      lists.removeAt(index);
    });
    SnackBar snackBar = SnackBar(
      content: Text('Deleted $deleteRecord'),
      action: SnackBarAction(
        label: "UNDO",
        onPressed: (){
          setState((){
            lists.insert(index, deleteRecord);
          });
        },
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
