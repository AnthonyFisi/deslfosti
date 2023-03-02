import 'package:flutter/material.dart';
import 'package:sqlite_crud/database/database_connection.dart';
import 'package:sqlite_crud/model/publication.dart';
import 'package:sqlite_crud/widget/message.dart';

class CreatePublication extends StatefulWidget {
  const CreatePublication({super.key});

  @override
  State<CreatePublication> createState() => _CreatePublicationState();
}

class _CreatePublicationState extends State<CreatePublication> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController titleController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    titleController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Must enter a title";
                }
                return null;
              },
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextFormField(
              controller: descriptionController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Must enter a description";
                }
                return null;
              },
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    DB.insert(Publication(
                        title: titleController.text,
                        description: descriptionController.text,stateBad: 0 ,stateGood: 0));

                    alertMessage(context);
                    _formKey.currentState?.reset();

                    /*Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ListPublication()));*/
                  }
                },
                child: const Text('Save')),
          ],
        ),
      ),
    );
  }
}
