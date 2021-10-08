import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_app/pages/add_contact.dart';
import 'package:test_app/service/auth.dart';

// ignore: must_be_immutable
class UserPage extends StatefulWidget {
  String? title;
  UserPage({Key? key, this.title}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  TextEditingController textEditingController = TextEditingController();
  bool appbar = false;

  AppBar appBar() => AppBar(
        title: const Text("Список контактов"),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                appbar = true;
              });
            },
            icon: const Icon(Icons.search),
          ),
        ],
      );

  AppBar appBarSearch() => AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: TextField(
          controller: textEditingController,
          // onChanged: searchList,
          cursorColor: Colors.white,
        ),
        centerTitle: true,
        leading: const Icon(Icons.search),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                appbar = false;
              });
            },
            icon: const Icon(Icons.cancel),
          ),
        ],
      );

  Widget buildList(context, docs, AsyncSnapshot<dynamic> snapshot) {
    return SizedBox(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Text(
            docs['name'],
          ),
          subtitle: Text(
            docs['phone'].toString(),
          ),
          leading: Image.network(
            docs['image'],
          ),
          trailing: const Icon(Icons.arrow_right),
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => AddContact(
                  title: "Изменить/Удалить",
                  documentFirebase: docs,
                  name: docs['name'],
                  phone: docs['phone'],
                  image: docs['image'],
                  invisible: true,
                  // id: docs['id'],
                  id: AuthServices().showID(),
                ),
              ),
            );
            // document.reference.update();
            // FirebaseFirestore.instance.runTransaction((transaction)async {
            //   DocumentSnapshot freshSnap = await transaction.get(document.reference);
            //    transaction.update(document.reference, {
            //     'phone': freshSnap['votes'] +"0"
            //   });
            // });
            
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar ? appBarSearch() : appBar(),
      body: StreamBuilder(
        // Firestore переименован в FirebaseFirestore
        // в Stream вытаскиваем коллекцию контактов и делаем снимок(копию)
        stream: FirebaseFirestore.instance.collection("contacts").snapshots(),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          // проверка на наличие данных, то есть на null и соединение с Firebase
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          } else {
            // билдим данных в listView через builder
            // Для БД лучше использовать его listView.builder
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              // Именовать лучше docs
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                return buildList(context, snapshot.data.docs[index], snapshot);
              },
            );
            // Этот вариант тоже приемлемый, но данные будут повторятся
            // return ListView.separated( physics: const BouncingScrollPhysics(),
            //   // Именовать лучше docs
            //   itemCount: snapshot.data.docs.length,
            //   itemBuilder: (context, index) => buildList(
            //     context,
            //     snapshot.data.docs[index],
            //   ), separatorBuilder: (BuildContext context, int index) =>print(""),);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        onPressed: () => Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => AddContact(
              title: "Добавить",
              invisible: false,
            ),
          ),
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
