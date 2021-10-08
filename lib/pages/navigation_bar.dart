import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:test_app/blocs/counter_bloc.dart';

class NaviGate extends StatefulWidget {
  const NaviGate({Key? key}) : super(key: key);

  @override
  _NaviGateState createState() => _NaviGateState();
}

class _NaviGateState extends State<NaviGate> {
  int index = 0;
  final list = [
    const OnePage(),
    const TwoPage(),
    const TreePage(),
    const FourPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        centerTitle: true,
        title: const Text("NavigationBar"),
      ),
      body: list[index],
      bottomNavigationBar: SnakeNavigationBar.gradient(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
            // bottomLeft: Radius.circular(20),
            // bottomRight: Radius.circular(20),
          ),
        ),
        backgroundGradient: const LinearGradient(
          colors: [
            Colors.blueGrey,
            Colors.transparent,
            Colors.blueGrey,
          ],
        ),
        selectedItemGradient: const LinearGradient(
          colors: [
            Colors.white,
            Colors.white,
            Colors.white,
          ],
        ),
        snakeViewGradient: const LinearGradient(
          colors: [
            Colors.blueGrey,
            Colors.blueGrey,
            Colors.blueGrey,
          ],
        ),
        unselectedItemGradient: const LinearGradient(
          colors: [
            Colors.blueGrey,
            Colors.blueGrey,
            Colors.blueGrey,
          ],
        ),
        // backgroundColor: Colors.blueGrey[10],
        // snakeViewColor: Colors.blueGrey[400],
        // selectedItemColor: Colors.white,
        // unselectedItemColor: Colors.white30,
        onTap: (ind) {
          setState(() {
            index = ind;
          });
        },
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.accessible_forward_rounded), label: '1 page'),
          BottomNavigationBarItem(
              icon: Icon(Icons.accessible_forward_rounded), label: '2 page'),
          BottomNavigationBarItem(
              icon: Icon(Icons.accessible_forward_rounded), label: '3 page'),
          BottomNavigationBarItem(
              icon: Icon(Icons.accessible_forward_rounded), label: '4 page'),
        ],
        // shadowColor: Colors.white,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(
          color: Colors.white,
          fontStyle: FontStyle.italic,
        ),
        unselectedLabelStyle: const TextStyle(
          color: Colors.white,
          fontStyle: FontStyle.italic,
        ),
      ),

      // bottomNavigationBar: SalomonBottomBar(
      //   selectedItemColor: Colors.white,
      //   itemShape: StadiumBorder(
      //     side: BorderSide(color: Colors.white)
      //   ),
      //   items: [
      //     SalomonBottomBarItem(
      //       icon: const Icon(Icons.ac_unit),
      //       title: const Text("1 Page"),
      //     ),
      //     SalomonBottomBarItem(
      //       icon: const Icon(Icons.ac_unit),
      //       title: const Text("2 Page"),
      //     ),
      //      SalomonBottomBarItem(
      //       icon: const Icon(Icons.ac_unit),
      //       title: const Text("2 Page"),
      //     ),
      //      SalomonBottomBarItem(
      //       icon: const Icon(Icons.ac_unit),
      //       title: const Text("2 Page"),
      //     ),
      //   ],
      //   currentIndex: index,
      //   onTap: (ind){
      //     setState(() {
      //       index=ind;
      //     });
      //   },
      // ),
      // bottomNavigationBar: SizedBox(
      //   height: MediaQuery.of(context).size.height * 0.1,
      //   width: MediaQuery.of(context).size.width * 0.6,
      //   child: BottomNavigationBar(
      //     backgroundColor: Colors.white,
      //     currentIndex: index,
      //     items: const [
      //       BottomNavigationBarItem(
      //           icon: Icon(
      //             Icons.account_tree,
      //           ),
      //           label: "1Page"),
      //       BottomNavigationBarItem(
      //           icon: Icon(
      //             Icons.account_tree,
      //           ),
      //           label: "2Page"),
      //     ],
      //     onTap: (ind) {
      //       setState(() {
      //         index = ind;
      //       });
      //     },
      //   ),
      // ),
    );
  }
}

class OnePage extends StatelessWidget {
  const OnePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Image.network(
          "https://firebasestorage.googleapis.com/v0/b/sprintdb-a764c.appspot.com/o/icon.png?alt=media&token=a55b18ab-58da-46e0-ba9d-9ce27f2c704a"),
    );
  }
}

// Для FirebaseRealTime
class TwoPage extends StatefulWidget {
  final FirebaseApp? app;
  const TwoPage({Key? key, this.app}) : super(key: key);

  @override
  State<TwoPage> createState() => _TwoPageState();
}

class _TwoPageState extends State<TwoPage> {
  final referenceDB = FirebaseDatabase.instance.reference();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ref = referenceDB.child('/Messages');
    return SizedBox(
      child: StreamBuilder(
          stream: ref.child('/Messages').orderByKey().onValue,
          builder: (context, snapshot) {
            final tileList = <ListTile>[];
            if (snapshot.hasData) {
              final message = Map<String, dynamic>.from(
                  (snapshot.data! as Event).snapshot.value);
              tileList.addAll(
                message.values.map(
                  (value) {
                    final next = Map<String, dynamic>.from(value);
                    return ListTile(
                      title: Text(next['Message1']),
                      subtitle: Text(next['Description']),
                    );
                  },
                ),
              );
            }
            return ListView(
              children: tileList,
            );
            // return FirebaseAnimatedList(
            //   query: ref,
            //   itemBuilder: (BuildContext context, DataSnapshot snapshot,
            //       Animation<double> animation, int index) {
            //         return ListTile(
            //           title: Text(snapshot.value),
            //           // title: ,
            //           onTap: (){},
            //         );
            //       },
            // );
          }),
    );
  }
}

class TreePage extends StatefulWidget {
  const TreePage({Key? key}) : super(key: key);

  @override
  State<TreePage> createState() => _TreePageState();
}

class _TreePageState extends State<TreePage> {
  CounterBloc bloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: StreamBuilder<int>(
        stream: bloc.stateStream.map((event) => event.counter * 2),
        builder: (context, snapshot) {
          return ElevatedButton(
              onPressed: () {
                bloc.increment();
              },
              child: Text(snapshot.data!.toString()));
        },
      ),
    );
  }
}

class FourPage extends StatefulWidget {
  const FourPage({Key? key}) : super(key: key);

  @override
  State<FourPage> createState() => _FourPageState();
}

class _FourPageState extends State<FourPage> {
  int couter = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
          onPressed: () {
            setState(() {
              couter++;
            });
          },
          child: Text(couter.toString())),
    );
  }
}
