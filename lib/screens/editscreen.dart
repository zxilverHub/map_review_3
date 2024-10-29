import 'package:flutter/material.dart';

class EditItem extends StatefulWidget {
  EditItem({super.key, required this.item, required this.editItem});

  final String item;
  final Function(String i) editItem;

  @override
  State<EditItem> createState() => _EditItemState();
}

class _EditItemState extends State<EditItem> {
  var editController = TextEditingController();

  void editDone() {
    widget.editItem(editController.text);
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    editController.text = widget.item;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit item"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              controller: editController,
              decoration: InputDecoration(
                label: Text("Edit"),
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: () => editDone(),
              child: Text("Confirm"),
            ),
          ],
        ),
      ),
    );
  }
}
