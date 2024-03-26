import 'package:flutter/material.dart';

class TudoApp extends StatefulWidget {
  const TudoApp({super.key});

  @override
  State<TudoApp> createState() => _TudoAppState();
}

class _TudoAppState extends State<TudoApp> {
  TextEditingController inputconntroller = TextEditingController();
  TextEditingController updateController = TextEditingController();

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

  void dltItems(int delete) {
    if (delete >= 0 && delete < counterName.length) {
      setState(() {
        counterName.removeAt(delete);
      });
    }
  }

  void updateItems(int index, String newValue) {
    if (index >= 0 && index < counterName.length) {
      setState(() {
        counterName[index] = newValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 195, 242),
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
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.purple,
                      ),
                      onPressed: () {
                        dltItems(index);
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.edit_document,
                        color: Colors.deepPurple,
                      ),
                      onPressed: () {
                        showUpdateDialog(index);
                      },
                    ),
                  ],
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

  void showUpdateDialog(int index) {
    updateController.text = counterName[index];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: TextField(
            controller: updateController,
            decoration: const InputDecoration(
              labelText: "Update Item",
              hintText: "Enter Updated Information",
              icon: Icon(Icons.update),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                updateItems(index, updateController.text);
                Navigator.pop(context);
              },
              child: const Text(
                "Update",
                style: TextStyle(color: Colors.purple),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.red),
              ),
            )
          ],
        );
      },
    );
  }
}
