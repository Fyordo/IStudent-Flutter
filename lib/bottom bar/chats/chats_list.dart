import 'package:flutter/material.dart';

class ChatsList extends StatefulWidget {
  const ChatsList({Key? key}) : super(key: key);

  @override
  _ChatsListState createState() => _ChatsListState();
}

class _ChatsListState extends State<ChatsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Row(
          children: [
            Text(
              "Чаты",
              style: TextStyle(fontSize: 25),
            ),
            Icon(Icons.keyboard_arrow_down_rounded)
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            width: double.infinity,
            child: ListView.separated(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) => ListTile(
                leading: CircleAvatar(
                    backgroundColor: Theme.of(context).secondaryHeaderColor,
                    radius: 30,
                    child: ClipOval(
                        child: new SizedBox(
                            child: Image.network(
                      "widget.avatar",
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                            'assets/images/user_without_photo.png');
                      },
                    )

                            //),
                            //
                            ))),
                title: Text("Чат $index"),
                subtitle: Row(
                  children: [
                    Text(
                      "Вы: Привет мир!",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      " · 4ч",
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                trailing: Container(
                  width: 20,
                  height: 20,
                  child: ClipOval(
                    child: Container(
                      color: Theme.of(context).primaryColor,
                      child: Center(
                        child: Text("1",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 15)),
                      ),
                    ),
                  ),
                ),
              ),
              separatorBuilder: (BuildContext context, int index) => Divider(
                height: 1,
                color: Theme.of(context).hintColor,
              ),
            )),
      ),
    );
  }
}
