import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Todo App",
      home: Todo(),
    ));

class Todo extends StatefulWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  late String value;

  var listTODO = [''];

  addTODO(String item) {
    setState(() {
      listTODO.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("TODO"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            addTODO(value);
          },
        ),
        body: ListView.builder(
            itemCount: listTODO.length,
            itemBuilder: ((context, index) {
              return index == 0
                  ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Add Item",
                          ),
                          onChanged: (val) {
                            setState(() {
                              value = val;
                            });
                          }),
                    )
                  : ListTile(
                      leading: Icon(Icons.work),
                      title: Text(
                        '${listTODO[index]}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    );
            })));
  }
}
