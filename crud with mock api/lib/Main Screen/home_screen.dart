import 'package:flutter/material.dart';
import 'package:newproject/Resources/helper.dart';
import 'package:newproject/profilescreen/profile.dart';

import '../Resources/constant.dart';
import '../Resources/theme.dart';
import '../secondscreen/add.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List user = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getMyData();
  }

  getMyData() async {
    await Data.getData().then((value) => setState(() {
          user = value;
          isLoading = false;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('User Details'),
            FloatingActionButton.small(
              backgroundColor: appBarColor,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddNewUser(),
                  ),
                );
              },
              child: const Icon(
                Icons.add,
                size: 30,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Row(
        children: [
          Expanded(
            child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: isLoading == false
                    ? ListView.builder(
                        itemCount: user.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () async {
                              var test = await Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      pageBuilder: (_, __, ___) => ProfilePage(
                                            avatar: user[index]['avatar'],
                                            id: user[index]['id'],
                                            name: user[index]['name'],
                                          ),
                                      transitionDuration:
                                          const Duration(milliseconds: 1600)));

                              if (test == true) {
                                getMyData();
                              }
                            },
                            horizontalTitleGap: 40.0,
                            contentPadding: listTileContentPadding,
                            title: Text(
                              user[index]['name'],
                              style: userNameTextStyle,
                            ),
                            leading: Hero(
                              tag: user[index]['id'],
                              child: CircleAvatar(
                                radius: 30.0,
                                backgroundImage:
                                    NetworkImage(user[index]['avatar']),
                              ),
                            ),
                          );
                        },
                      )
                    : const Center(
                        child: Text('Loading....'),
                      )),
          ),
        ],
      ),
    );
  }
}
