import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/pages/navigation_bar.dart';
import 'package:test_app/pages/user_list_db.dart';
import 'package:test_app/service/auth.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  String? title;
  HomePage({Key? key, this.title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool appbar = false;
  TextEditingController controllerSeach = TextEditingController();
  // создаем новый лист пользователей для того, чтобы все объекты записались в этот лист и произошла сортировка в этои листе
  List<User> newListUser = List.from(userList);
  AuthServices authServices = AuthServices();
  final String _email = AuthServices().showEmail();
  final String _id = AuthServices().showID();

// Метод сортировки листа
  listSearch(String search) {
    // Меняем состояние листа
    setState(() {
      newListUser = userList
          .where(
            (element) =>
                element.name!.toLowerCase().contains(
                      search.toLowerCase(),
                    ) ||
                element.name!.toUpperCase().contains(
                      search.toUpperCase(),
                    ),
          )
          .toList();
      // newListUser = userList
      //     .where(
      //       (element) =>
      //           element.name!.toLowerCase() == search.trim() ||
      //           element.name!.toUpperCase() == search.trim(),
      //     )
      //     .toList();
    });
  }

// AppBar с поисковиком
  AppBar searchBar() => AppBar(
        leading: const Icon(Icons.search),
        centerTitle: true,
        // Не забыть добавить метод сортировки в TextField
        title: TextField(
          controller: controllerSeach,
          ////
          onChanged: listSearch,
          ////
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Меняем состояние AppBar с помощью переменной bool
              setState(() {
                appbar = false;
              });
              // Cтираем данные и обновляем лист
              controllerSeach.clear();
              listSearch("");
            },
            icon: const Icon(
              Icons.cancel_rounded,
            ),
          ),
        ],
      );
  // AppBar стандартный
  AppBar appBar() => AppBar(
        centerTitle: true,
        title: const Text("TestApp"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                // Меняем состояние AppBar с помощью переменной bool
                appbar = true;
              });
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Проверяем переменную bool и исходя из этого ставим Appbar в приложение
      appBar: appbar ? searchBar() : appBar(),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: [
                // С обновлением 2.5.0 можно ставить SizedBox вместо Container(тоже самое только в контейнере можно менять цвет)
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Card(
                    child: Column(
                      children: [
                        Image.asset(
                          "images/logo.png",
                          height: MediaQuery.of(context).size.height * 0.15,
                        ),
                        const ListTile(
                          title: Text("Hello"),
                          subtitle:
                              Text("amdioawdnioawncioncnawonciawncioawinco"),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Card(
                    child: Column(
                      children: [
                        Image.asset(
                          "images/logo.png",
                          height: MediaQuery.of(context).size.height * 0.15,
                        ),
                        const ListTile(
                          title: Text("Hello"),
                          subtitle:
                              Text("amdioawdnioawncioncnawonciawncioawinco"),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Card(
                    child: Column(
                      children: [
                        Image.asset(
                          "images/logo.png",
                          height: MediaQuery.of(context).size.height * 0.15,
                        ),
                        const ListTile(
                          title: Text("Hello"),
                          subtitle:
                              Text("amdioawdnioawncioncnawonciawncioawinco"),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Card(
                    child: Column(
                      children: [
                        Image.asset(
                          "images/logo.png",
                          height: MediaQuery.of(context).size.height * 0.15,
                        ),
                        const ListTile(
                          title: Text("Hello"),
                          subtitle:
                              Text("amdioawdnioawncioncnawonciawncioawinco"),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Card(
                    child: Column(
                      children: [
                        Image.asset(
                          "images/logo.png",
                          height: MediaQuery.of(context).size.height * 0.15,
                        ),
                        const ListTile(
                          title: Text("Hello"),
                          subtitle:
                              Text("amdioawdnioawncioncnawonciawncioawinco"),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Card(
                    child: Column(
                      children: [
                        Image.asset(
                          "images/logo.png",
                          height: MediaQuery.of(context).size.height * 0.15,
                        ),
                        const ListTile(
                          title: Text("Hello"),
                          subtitle:
                              Text("amdioawdnioawncioncnawonciawncioawinco"),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Card(
                    child: Column(
                      children: [
                        Image.asset(
                          "images/logo.png",
                          height: MediaQuery.of(context).size.height * 0.15,
                        ),
                        const ListTile(
                          title: Text("Hello"),
                          subtitle:
                              Text("amdioawdnioawncioncnawonciawncioawinco"),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Card(
                    child: Column(
                      children: [
                        Image.asset(
                          "images/logo.png",
                          height: MediaQuery.of(context).size.height * 0.15,
                        ),
                        const ListTile(
                          title: Text("Hello"),
                          subtitle:
                              Text("amdioawdnioawncioncnawonciawncioawinco"),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Card(
                    child: Column(
                      children: [
                        Image.asset(
                          "images/logo.png",
                          height: MediaQuery.of(context).size.height * 0.15,
                        ),
                        const ListTile(
                          title: Text("Hello"),
                          subtitle:
                              Text("amdioawdnioawncioncnawonciawncioawinco"),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Card(
                    child: Column(
                      children: [
                        Image.asset(
                          "images/logo.png",
                          height: MediaQuery.of(context).size.height * 0.15,
                        ),
                        const ListTile(
                          title: Text("Hello"),
                          subtitle:
                              Text("amdioawdnioawncioncnawonciawncioawinco"),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Card(
                    child: Column(
                      children: [
                        Image.asset(
                          "images/logo.png",
                          height: MediaQuery.of(context).size.height * 0.15,
                        ),
                        const ListTile(
                          title: Text("Hello"),
                          subtitle:
                              Text("amdioawdnioawncioncnawonciawncioawinco"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // НИЖНАЯ ЧАСТЬ С ЛИСТОМ
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: newListUser
                  .map(
                    (user) => Card(
                      child: ListTile(
                        leading: Icon(
                          Icons.account_box,
                          color: Colors.green[300],
                        ),
                        title: Text(user.name!),
                        subtitle: Text(user.phone!),
                        onTap: () {},
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white12,
                ),
                currentAccountPicture: const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(
                      "https://firebasestorage.googleapis.com/v0/b/sprintdb-a764c.appspot.com/o/icon.png?alt=media&token=a55b18ab-58da-46e0-ba9d-9ce27f2c704a"),
                ),
                accountName: Text(_email),
                accountEmail: Text(_id),
                otherAccountsPictures: [
                  IconButton(
                    onPressed: () async {
                      showDialog(
                          context: context,
                          builder: (context) => Dialog(
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  color: Colors.transparent,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Вы хотите выйти?",
                                        textScaleFactor:
                                            MediaQuery.textScaleFactorOf(
                                                    context) *
                                                2,
                                      ),
                                      Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.25,
                                              child: OutlinedButton(
                                                style: OutlinedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  side: const BorderSide(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                child: const Text(
                                                  "Отмена",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.03,
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.25,
                                              child: OutlinedButton(
                                                style: OutlinedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  side: const BorderSide(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                child: const Text(
                                                  "Ок",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                onPressed: () async {
                                                  await authServices.singOut();
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ));
                    },
                    icon: const Icon(
                      Icons.exit_to_app,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text("Контакты"),
              leading: const Icon(
                Icons.account_box,
                color: Colors.green,
              ),
              onTap: () => Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => UserPage(
                    title: "Список контактов",
                  ),
                ),
              ),
            ),
            ListTile(
              title: const Text('Навигация'),
               leading: const Icon(
                Icons.navigate_next,
                color: Colors.green,
              ),
              onTap: ()=>Navigator.push(context,CupertinoPageRoute(builder: (context)=>const NaviGate())),
            ),
          ],
        ),
      ),
    );
  }
}

class User {
  String? name;
  String? phone;
  User({this.name, this.phone});
}

List<User> userList = [
  User(name: "Brian", phone: "8839080989883"),
  User(name: "James", phone: "8989678678789"),
  User(name: "Harry", phone: "7889898908900"),
  User(name: "Amir", phone: "789890890890"),
  User(name: "Tim", phone: "88989890890890"),
  User(name: "Brian", phone: "8839080989883"),
  User(name: "James", phone: "8989678678789"),
  User(name: "Harry", phone: "7889898908900"),
  User(name: "Amir", phone: "789890890890"),
  User(name: "Tim", phone: "88989890890890"),
  User(name: "Brian", phone: "8839080989883"),
  User(name: "James", phone: "8989678678789"),
  User(name: "Harry", phone: "7889898908900"),
  User(name: "Amir", phone: "789890890890"),
  User(name: "Tim", phone: "88989890890890"),
  User(name: "Brian", phone: "8839080989883"),
  User(name: "James", phone: "8989678678789"),
  User(name: "Harry", phone: "7889898908900"),
  User(name: "Amir", phone: "789890890890"),
  User(name: "Tim", phone: "88989890890890"),
  User(name: "Brian", phone: "8839080989883"),
  User(name: "James", phone: "8989678678789"),
  User(name: "Harry", phone: "7889898908900"),
  User(name: "Amir", phone: "789890890890"),
  User(name: "Tim", phone: "88989890890890"),
];
