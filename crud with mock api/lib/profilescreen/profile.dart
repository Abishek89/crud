import 'package:flutter/material.dart';
import 'package:newproject/Resources/helper.dart';
import 'package:newproject/profilescreen/update.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage(
      {Key? key, required this.avatar, required this.id, required this.name})
      : super(key: key);
  final String avatar;
  final String id;
  final String name;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late String avatar;
  late String id;
  late String name;

  @override
  void initState() {
    super.initState();
    updateUI(
      widget.name,
      widget.id,
      widget.avatar,
    );
  }

  void updateUI(String uName, String uId, String uAvatar) {
    setState(() {
      name = uName;
      avatar = uAvatar;
      id = uId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 15),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: widget.id,
              child: CircleAvatar(
                radius: 105.0,
                child: CircleAvatar(
                  radius: 100.0,
                  backgroundImage: NetworkImage(avatar),
                ),
              ),
            ),
            Text(
              name,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                NewWidget(
                  title: 'ID',
                  value: id,
                ),
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    var test = await showDialog(
                      context: context,
                      builder: (context) {
                        return GlobalWidgets(
                            userName: name, avatarImage: avatar, id: id);
                      },
                    );
                    if (test == true) {}
                  },
                  child: const Text(
                    'Update',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Edit().deleteData(id).then((value) => {
                          Navigator.pop(context, true),
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('User deleted successfully'),
                            duration: Duration(seconds: 2),
                          )),
                        });
                  },
                  child: const Text(
                    'Delete',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(
            fontSize: 23.0,
            color: Colors.grey,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
