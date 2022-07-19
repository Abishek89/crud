import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day2intern/pages/edituser.dart';
import 'package:flutter/material.dart';

class ListUser extends StatefulWidget {
  const ListUser({Key? key}) : super(key: key);

  @override
  State<ListUser> createState() => _ListUserState();
}

class _ListUserState extends State<ListUser> {
  List allData = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getData();
  }

  final CollectionReference ref =
      FirebaseFirestore.instance.collection('Users');

  Future<void> getData() async {
    allData.clear();
    await ref
        .get()
        .then((value) => value.docs.forEach((element) {
              var data = {
                'id': element.id,
                'name': element.get('Name'),
                'age': element.get('Age'),
                'phone': element.get('Phone Number')
              };
              allData.add(data);
            }))
        .then((value) => setState(() {
              isLoading = false;
              allData;
            }))
        .catchError((onError) => {print(onError)});
  }

  void deleteUser(String id) async {
    await ref.doc(id).delete().then((value) => getData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading == false
          ? ListView.builder(
              itemCount: allData.length,
              itemBuilder: (BuildContext context, index) {
                return ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 5,
                        width: 0,
                      ),
                      Text('Name: ${allData[index]['name']}'),
                      Text('Age:  ${allData[index]['age']}'),
                      Text('Phone Number: ${allData[index]['phone']}'),
                    ],
                  ),
                  leading: const Icon(Icons.arrow_forward_ios),
                  trailing: Container(
                    color: Colors.white,
                    width: 100.0,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditUser(
                                        id: allData[index]['id'],
                                        name: allData[index]['name'],
                                        age: allData[index]['age'],
                                        phone: allData[index]['phone'])));
                          },
                          icon: const Icon(Icons.edit),
                          color: Colors.blue,
                        ),
                        IconButton(
                          onPressed: () {
                            deleteUser(allData[index]['id']);
                          },
                          icon: const Icon(Icons.delete),
                          color: Colors.red,
                        )
                      ],
                    ),
                  ),
                );
              },
            )
          : const Center(
              child: Text('Loading....'),
            ),
    );
  }
}
