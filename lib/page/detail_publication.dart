import 'package:flutter/material.dart';
import 'package:sqlite_crud/database/database_connection.dart';
import 'package:sqlite_crud/model/publication.dart';
import 'package:sqlite_crud/page/list_publication.dart';

class DetailPublication extends StatefulWidget {
  final Publication publication;

  const DetailPublication({super.key, required this.publication});

  @override
  State<DetailPublication> createState() => _DetailPublicationState();
}

class _DetailPublicationState extends State<DetailPublication> {
  late Publication publication;
  static const int ENABLE = 1;
  static const int DISABLE = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    publication = widget.publication;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail publication'),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text('Title'),
            subtitle: Text(publication.title),
          ),
          ListTile(
            title: const Text('Description'),
            subtitle: Text(publication.description),
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () async {

                    publication.stateGood == DISABLE ? publication.stateGood = ENABLE : publication.stateGood = DISABLE;

                    await DB.update(publication);

                    setState((){
                      publication.stateGood;
                    });
                  },
                  icon: publication.stateGood == 0
                      ? const Icon(Icons.thumb_up_alt_outlined)
                      : const Icon(Icons.thumb_up_alt)),
              IconButton(
                  onPressed: () async {

                    publication.stateBad == DISABLE ? publication.stateBad = ENABLE : publication.stateBad = DISABLE;

                    await DB.update(publication);

                    setState((){
                      publication.stateBad;
                    });
                  },
                  icon: publication.stateBad == 0
                      ? const Icon(Icons.thumb_down_outlined)
                      : const Icon(Icons.thumb_down))
            ],
          ),

          ElevatedButton(
              onPressed: () async {
                Navigator.pop(context,publication);
              },
              child: const Text('Save change')),

        ],
      ),
    );
  }
}
