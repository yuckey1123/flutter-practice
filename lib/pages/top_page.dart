import 'package:flutter/material.dart';
import 'package:flutter_practice/pages/talk_room_page.dart';

import '../model/user.dart';

class TopPage extends StatefulWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  List<User> userList = [
    User(
        name: 'チェンバー',
        uid: 'abc',
        imagePath:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmJjWmOaEIRhHJTXoPs9OF-kzsdbS7OTbGew&usqp=CAU',
        lastMessage: '消えてもらおうか'),
    User(
        name: 'セージ',
        uid: 'def',
        imagePath:
            'https://1.bp.blogspot.com/-mwFpzCFijK8/X5pUCfETFEI/AAAAAAAADfQ/V5ShKUPV3B8XvYKUbf6nkWWaVymfPEd2QCLcBGAsYHQ/s2000/sage-is-getting-hit-by-the-nerf-hammer-in-valorant-patch-1-04-1.jpg',
        lastMessage: 'まだ終わりじゃないわ'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('チャットアプリ'),
        ),
        body: ListView.builder(
            itemCount: userList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TalkRoomPage(userList[index].name)
                      ));
                },
                child: SizedBox(
                  height: 70,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: userList[index].imagePath == null
                              ? null
                              : NetworkImage(userList[index].imagePath!),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            userList[index].name,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            userList[index].lastMessage,
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }));
  }
}
