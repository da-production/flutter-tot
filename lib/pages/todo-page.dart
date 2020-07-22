import 'package:flutter/material.dart';
import 'package:tot/models/todo-model.dart';

class TodoPage extends StatefulWidget {
  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: TodoList(),
    );
  }
}

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final title = TextEditingController();
  final descrition = TextEditingController();
  List _todoList = [
    TodoModel(id: 1, title: 'Flutter', description: 'Cross Platform Framework',favorite: false),
    TodoModel(id: 2, title: 'React Native', description: 'Cross Platform Framework',favorite: true)
  ];

  _addNewTask(){
    if(title.text != '' && descrition.text != ""){
      setState(() {
        return _todoList.add(TodoModel(id: _todoList.length, title: title.text, description: descrition.text, favorite: false),);
      });
    }
  }
  _formInputs(){
    return new Card(
      shadowColor: Colors.deepPurpleAccent[100],
      elevation: 15,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
      ),
      child: new Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text('Add New Framework / Librarie', style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 18),),
            TextField(
              controller: title,
              decoration: InputDecoration(
                hintText: 'Exemple: Flutter',
                labelText: 'Name',
                hoverColor: Colors.deepPurpleAccent,
                fillColor: Colors.deepPurpleAccent,
              ),
            ),
            TextField(
              controller: descrition,
              decoration: InputDecoration(
                  hintText: 'Exemple: Cross Platform Framework',
                  labelText: 'Description'
              ),
            ),
            SizedBox(height: 25,),
            FloatingActionButton(
              child: Icon(Icons.add),
              backgroundColor: Colors.deepPurpleAccent,
              elevation: 10,
              onPressed: _addNewTask,
            ),
          ],
        ),
      ),
    );
  }


  ListView _todoListBuilder(){
    return ListView.builder(
        reverse: false,
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: _todoList.length,
        itemBuilder: (context, i){
          return Container(
            margin: EdgeInsets.only(bottom: 10),
            child: new Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              elevation: 10,
              child: ListTile(
                dense: true,
                leading: InkWell(
                  child: _todoList[i].favorite == true ? Icon(Icons.star,color: Colors.yellow ,size: 35,) : Icon(Icons.star_border ,size: 35,),
                  onTap: null,
                ),
                title: Text(_todoList[i].title),
                subtitle: Text(_todoList[i].description),
                trailing: InkWell(
                  child: Icon(Icons.delete_forever, color: Colors.red,),
                  onTap: () {
                    setState(() {
                      _todoList.removeWhere((item) => item.id == _todoList[i].id);
                    });
                  },
                ),
              ),
            ),
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            _formInputs(),
            SizedBox(height: 25,),
            Divider(color: Colors.deepPurpleAccent,),
            Row(
              children: <Widget>[
                Icon(Icons.list),
                Text('Frameworks:')
              ],
            ),
            SizedBox(height: 5,),
            _todoListBuilder()
          ],
        ),
      ),
    );
  }
}

