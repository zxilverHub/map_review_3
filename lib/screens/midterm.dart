import 'package:flutter/material.dart';
import 'package:midterm_review_2/screens/editscreen.dart';

class Midterm extends StatefulWidget {
  const Midterm({super.key});

  @override
  State<Midterm> createState() => _MidtermState();
}

class _MidtermState extends State<Midterm> {
  List<String> items = [];

  var itemController = TextEditingController();
  String toEdit = "";

  editItem(String item) {
    setState(() {
      List<String> newItems = items.map((i) => i == toEdit ? item : i).toList();
      items = newItems;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("$toEdit is changed to $item"),
      ),
    );
  }

  void goToEdit(String i) {
    setState(() {
      toEdit = i;
    });

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => EditItem(
          item: i,
          editItem: editItem,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Midterm review"),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.delete),
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                TextField(
                  controller: itemController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Item"),
                    hintText: "Item",
                    suffixIcon: IconButton(
                      onPressed: () => addItem(),
                      icon: Icon(Icons.add),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: items.map((i) {
                        return Card(
                          child: TextButton(
                            onPressed: () => goToEdit(i),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(i),
                                IconButton(
                                  onPressed: () => deleteItem(i),
                                  icon: Icon(Icons.delete),
                                )
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  addItem() {
    setState(() {
      items.add(itemController.text);
      itemController.text = "";
    });
  }

  deleteItem(String del) {
    setState(() {
      items.removeWhere((i) => i == del);
    });
  }
}
