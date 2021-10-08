import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_app/service/auth.dart';
import 'package:test_app/styles/style_elevated_button.dart';
import 'package:test_app/styles/style_text_field.dart';

// ignore: must_be_immutable
class AddContact extends StatefulWidget {
  // для передачи информации с предыдущей страницы
  String? title;
  bool? invisible;
  dynamic documentFirebase;
  String? name;
  String? phone;
  String? image;
  String? id;
  AddContact(
      {Key? key,
      this.title,
      this.documentFirebase,
      this.name,
      this.phone,
      this.image,
      this.invisible,
      this.id})
      : super(key: key);

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  // для записи тектса
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController imagecontroller = TextEditingController();
  TextEditingController idcontroller = TextEditingController();
  Contact contact = Contact();

  @override
  Widget build(BuildContext context) {
    bool imageTwest() {
      bool image = false;
      if (widget.image == null) {
        image = true;
      } else {
        image = false;
      }
      return image;
    }

    // проверка на наличие данных
    if (widget.name != null ||
        widget.image != null ||
        widget.phone != null ||
        widget.id != null) {
      namecontroller.text = widget.name.toString();
      phonecontroller.text = widget.phone.toString();
      imagecontroller.text = widget.image.toString();
      idcontroller.text = widget.id.toString();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Card(
                  child: TextField(
                    controller: namecontroller,
                    cursorColor: Colors.white,
                    decoration: inputDecorationName,
                  ),
                ),
                Card(
                  child: TextField(
                    controller: phonecontroller,
                    decoration: inputDecorationPhone,
                    cursorColor: Colors.white,
                  ),
                ),
                Card(
                  child: TextField(
                    controller: imagecontroller,
                    decoration: inputDecorationImage,
                    cursorColor: Colors.white,
                  ),
                ),
                Card(
                  child: TextField(
                    controller: idcontroller,
                    decoration: idDecoration,
                    cursorColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: ElevatedButton(
                    style: elevatedButtonStyle,
                    onPressed: () async {
                      if (widget.invisible == true) {
                        Fluttertoast.showToast(
                            msg:
                                "Нельзя добавлять, только обновлять и удалять");
                      } else {
                        // присваеваем значение классу Contact
                        contact.name = namecontroller.text;
                        contact.phone = phonecontroller.text;
                        contact.image = imagecontroller.text;
                        // Соединить и определить коллекцию
                        CollectionReference contacts =
                            FirebaseFirestore.instance.collection('contacts');
                        // Далее через linq добавляем контакт
                        await contacts.add(
                          {
                            'id': contact.id,
                            'name': contact.name,
                            'phone': contact.phone,
                            'image': contact.image,
                          },
                        );
                        // очищаем контроллеры
                        namecontroller.clear();
                        phonecontroller.clear();
                        imagecontroller.clear();
                        Navigator.pop(context);
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [Text("Добавить"), Icon(Icons.add)],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: ElevatedButton(
                    style: elevatedButtonStyle,
                    onPressed: () async {
                      // Соединить и определить коллекцию
                      CollectionReference contacts =
                          FirebaseFirestore.instance.collection('contacts');
                      // Один из вариантов удаления
                      // DocumentReference documentReference = contacts.doc(widget.documentFirebase.id);
                      // // Далее через linq удаляем контакт
                      // // удалить по названию документа
                      // await contacts.doc(documentReference.id).delete();
                      await contacts.doc(widget.documentFirebase.id).delete();
                      namecontroller.clear();
                      phonecontroller.clear();
                      imagecontroller.clear();
                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Удалить"),
                        Icon(Icons.delete),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: ElevatedButton(
                    style: elevatedButtonStyle,
                    onPressed: () async {
                      // Соединить и определить коллекцию
                      CollectionReference contacts =
                          FirebaseFirestore.instance.collection('contacts');
                      // Далее через linq обновляем контакт
                      // обновить по названию документа
                      await contacts.doc(widget.documentFirebase.id).update(
                        {
                          'name': namecontroller.text,
                          'phone': phonecontroller.text,
                          'image:': imagecontroller.text
                        },
                      );
                      // очищаем контроллеры
                      namecontroller.clear();
                      phonecontroller.clear();
                      imagecontroller.clear();
                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Обновить"),
                        Icon(
                          Icons.delete,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: ListTile(
        leading: imageTwest()
            ? const Icon(Icons.account_box)
            : Image.network(widget.image.toString()),
        title: imageTwest()
            ? const Text("Нет контакта")
            : Text(widget.name.toString()),
        subtitle: imageTwest()
            ? const Text("Нет контакта")
            : Text(widget.phone.toString()),
      ),
    );
  }
}

// https://firebasestorage.googleapis.com/v0/b/sprintdb-a764c.appspot.com/o/icon.png?alt=media&token=a55b18ab-58da-46e0-ba9d-9ce27f2c704a

// Класс контактов для добавления в БД
class Contact {
  String? name;
  String? phone;
  String? image;
  String id = AuthServices().showID();
  Contact({
    this.name,
    this.phone,
    this.image,
  });
}




