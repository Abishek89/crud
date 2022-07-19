import 'package:flutter/material.dart';
import '../Resources/helper.dart';

class GlobalWidgets extends StatefulWidget {
  const GlobalWidgets(
      {Key? key,
      required this.userName,
      required this.avatarImage,
      required this.id})
      : super(key: key);

  final String userName;
  final String avatarImage;
  final String id;

  @override
  State<GlobalWidgets> createState() => _GlobalWidgetsState();
}

class _GlobalWidgetsState extends State<GlobalWidgets> {
  @override
  Widget build(BuildContext context) {
    String updatedName = widget.userName;
    return AlertDialog(
      elevation: 5.0,
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Edit()
                .updateData(widget.id, updatedName)
                .then((value) => Navigator.pop(context, true))
                .then((value) => {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Updated successfully'),
                        duration: Duration(seconds: 2),
                      )),
                    });
          },
          child: const Text(
            'Submit',
            style: TextStyle(color: Color.fromARGB(255, 4, 4, 3)),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Cancel',
            style: TextStyle(color: Color.fromARGB(255, 5, 5, 3)),
          ),
        ),
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 80.0,
            backgroundImage: NetworkImage(widget.avatarImage),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: TextFormField(
              initialValue: widget.userName,
              autofocus: false,
              cursorColor: const Color.fromARGB(255, 8, 7, 2),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 8, 7, 4), width: 2.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                label: const Text('Name'),
                labelStyle:
                    const TextStyle(color: Color.fromARGB(255, 9, 8, 6)),
              ),
              onChanged: (value) {
                updatedName = value;
              },
            ),
          ),
        ],
      ),
    );
  }
}
