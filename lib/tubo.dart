import 'package:flutter/material.dart';

class TudoApp extends StatefulWidget {
  const TudoApp({super.key});

  @override
  State<TudoApp> createState() => _TudoAppState();
}

class _TudoAppState extends State<TudoApp> {
  TextEditingController inputconntroller = TextEditingController();

  List counterName = [
    "Fahad Farooq",
    "Umer Farooq",
    "Farooq Khhan",
    "Arham Farooq",
    "Subhan Khhan",
  ];

  additems() {
    setState(() {
      counterName.add(inputconntroller.text);
    });
  }

  void dltItems({delete}) {
    setState(() {
      counterName.removeAt(delete);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tubo Application",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.purple),
        ),
        leading: GestureDetector(
          onTap: () {
            // Implement action for menu button tap
          },
          child: const Icon(Icons.menu),
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: counterName.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 2),
              child: ListTile(
                tileColor: Colors.teal,
                title: Text(
                  counterName[index],
                  style: const TextStyle(color: Colors.purple),
                ),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.purple,
                  ), // Icon for IconButton
                  onPressed: () {
                    dltItems(delete: index);
                  },
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showFormDialog();
        },
        backgroundColor: Colors.deepPurpleAccent,
        child: const Icon(Icons.add),
      ),
    );
  }

  void showFormDialog() {
    var alert = AlertDialog(
      content: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: inputconntroller,
              autofocus: true,
              decoration: const InputDecoration(
                  labelText: "Tubo Application",
                  hintText: "Enter Your Information: ",
                  icon: Icon(Icons.note_add)),
            ),
          )
        ],
      ),
      actions: <Widget>[
        GestureDetector(
          onTap: () {
            additems();
            inputconntroller.clear();
          },
          child: const Text(
            "Save ToDo Application",
            style: TextStyle(color: Colors.purple, fontSize: 15),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Text(
            "Cancel",
            style: TextStyle(color: Colors.red, fontSize: 15),
          ),
        )
      ],
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }
}
