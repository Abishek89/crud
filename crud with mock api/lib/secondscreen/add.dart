import 'package:flutter/material.dart';

import '../Resources/helper.dart';
import '../global/globalwidget.dart';

class AddNewUser extends StatefulWidget {
  const AddNewUser({Key? key}) : super(key: key);

  @override
  State<AddNewUser> createState() => _AddNewUserState();
}

class _AddNewUserState extends State<AddNewUser> {
  late String newUserName;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 30.0,
      actions: <Widget>[
        TextButton(
          onPressed: () async {
            await Helper().addUser(newUserName).then((value) => {
                  Navigator.pop(context, true),
                  ScaffoldMessenger.of(context).showSnackBar(
                    MultipleWidgets.gSnackBar('User added successfully'),
                  ),
                });
          },
          child: const Text(
            'Submit',
            style: TextStyle(color: Color.fromARGB(255, 15, 13, 10)),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Cancel',
            style: TextStyle(color: Color.fromARGB(255, 92, 70, 5)),
          ),
        ),
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter User Data',
              ),
              onChanged: (value) {
                newUserName = value;
              },
            ),
          ),
        ],
      ),
    );
  }
}
