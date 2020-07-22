import 'package:flutter/material.dart';
import 'package:tot/models/pages-model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PagesModel> pages = [
    PagesModel(title: 'Todo App', route: 'todo-page'),
    PagesModel(title: 'Login Form', route: 'login-page'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tot App'),
          backgroundColor: Colors.deepOrangeAccent,
        ),
        body: Padding(
            padding: EdgeInsets.all(5),
            child: ListView.builder(
                itemCount: pages.length,
                itemBuilder: (context, i){
                  return new Card(
                    elevation: 10,
                    child: ListTile(
                      title: Text(pages[i].title),
                      trailing: Icon(Icons.arrow_right),
                      onTap: (){
                        return Navigator.of(context).pushNamed(pages[i].route, arguments: pages[i].title);
                      },
                    ),
                  );
                }
            )
        )
    );
  }
}
