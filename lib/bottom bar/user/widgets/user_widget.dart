import 'package:flutter/material.dart';



class UserHomePage extends StatefulWidget {
  const UserHomePage({ Key? key }) : super(key: key);

  @override
  _UserHomePageState createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  @override
  Widget build(BuildContext context) {
    return  Container(
                  color: Theme.of(context).bottomAppBarColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppBar(
                        title:Text('Личный кабинет', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                        centerTitle: true,
                        backgroundColor: Colors.white,
                        actions: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(right: 15.0),
                              child: InkWell(
                                onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Logout')));
                                },
                                child: Icon(
                                  Icons.logout,
                                  size: 26.0,
                                  color: Colors.black,
                                ),
                              )
                          ),
                        ],
                      ),

                       Container(
                              height: 100,
                              decoration: new BoxDecoration (
                                  color: Colors.white
                              ),
                              child: InkWell(
                                  onTap: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(content: Text('Открывается галерея')));
                                  },
                                  child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                      ),
                                      child: Row(
                                        children: <Widget>[
                                          ClipRRect(
                                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                            clipper: UserAvatarClipper(),
                                            child: Image.asset('assets/images/user_placeholder.png'),
                                          ),
                                          Center(
                                              child: Text("Нажмите, чтобы изменить аватарку")
                                          ),
                                        ],
                                      )
                                  )
                              ),
                       ),

                      Container(
                        decoration: BoxDecoration(
                            border: Border.symmetric(vertical: BorderSide(width: 0.3)),
                        ),
                        child: Material(
                          child: ListTile(
                            title: Text("Фамилия", style: TextStyle(color: Colors.black26, fontSize: 15)),
                            subtitle: Text("Смирнова", style: TextStyle(color: Colors.black, fontSize: 17)),
                          ),
                        ),
                      ),

                      Container(
                        decoration: BoxDecoration(
                          border: Border.symmetric(vertical: BorderSide(width: 0.3)),
                        ),
                        child: Material(
                          child: ListTile(
                            title: Text("Имя", style: TextStyle(color: Colors.black26, fontSize: 15)),
                            subtitle: Text("Екатерина", style: TextStyle(color: Colors.black, fontSize: 17)),
                          ),
                        ),
                      ),

                      Container(
                        decoration: BoxDecoration(
                          border: Border.symmetric(vertical: BorderSide(width: 0.3)),
                        ),
                        child: Material(
                          child: ListTile(
                            title: Text("Отчество", style: TextStyle(color: Colors.black26, fontSize: 15)),
                            subtitle: Text("Петровна", style: TextStyle(color: Colors.black, fontSize: 17)),
                          ),
                        ),
                      ),

                      Container(
                        decoration: BoxDecoration(
                          border: Border.symmetric(vertical: BorderSide(width: 0.3)),
                        ),
                        child: Material(
                          child: ListTile(
                            title: Text("Пол", style: TextStyle(color: Colors.black26, fontSize: 15)),
                            subtitle: Text("Женский", style: TextStyle(color: Colors.black, fontSize: 17)),
                          ),
                        ),
                      ),

                      Container(
                        decoration: BoxDecoration(
                          border: Border.symmetric(vertical: BorderSide(width: 0.3)),
                        ),
                        child: Material(
                          child: ListTile(
                            title: Text("e-mail", style: TextStyle(color: Colors.black26, fontSize: 15)),
                            subtitle: Text("familia_i@sfedu.ru", style: TextStyle(color: Colors.black, fontSize: 17)),
                          ),
                        ),
                      ),

                      Container(
                        decoration: BoxDecoration(
                          border: Border.symmetric(vertical: BorderSide(width: 0.3)),
                        ),
                        child: Material(
                          child: ListTile(
                            title: Text("Группа", style: TextStyle(color: Colors.black26, fontSize: 15)),
                            subtitle: Text("1.2", style: TextStyle(color: Colors.black, fontSize: 17)),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
  }
}


class UserAvatarClipper extends CustomClipper<RRect> {


  @override
  RRect getClip(Size size) {

    final rrect = RRect.fromRectAndRadius(Rect.fromLTRB(5, 5, 90, 90), Radius.circular(10));
    return rrect;

  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {

    return false;

  }
}
