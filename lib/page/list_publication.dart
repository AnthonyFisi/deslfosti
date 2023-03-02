import 'package:flutter/material.dart';
import 'package:sqlite_crud/database/database_connection.dart';
import 'package:sqlite_crud/model/publication.dart';
import 'package:sqlite_crud/page/detail_publication.dart';

class ListPublication extends StatefulWidget {
  const ListPublication({super.key});

  @override
  State<ListPublication> createState() => _ListPublicationState();
}

class _ListPublicationState extends State<ListPublication> {
  List<Publication> publications = [];
  static const int ENABLE = 1;
  static const int DISABLE = 0;
  @override
  void initState() {
    loadPublication();
    super.initState();
  }

  loadPublication() async {
    List<Publication> auxPublications = await DB.publications();
    setState(() {
      publications = auxPublications;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: publications.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailPublication(
                                publication: publications[index])))
                    .then((tempPublication) {
                  setState(() {
                    publications.removeAt(index);
                    publications.insert(index, tempPublication);
                  });
                });
              },
              child: Card(
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Title'),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              publications[index].title,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                          const Text('Description'),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              publications[index].description,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            publications[index].stateGood == DISABLE
                                ? const Icon(Icons.thumb_up_alt_outlined)
                                : const Icon(Icons.thumb_up_alt),
                            publications[index].stateBad == DISABLE
                                ? const Icon(Icons.thumb_down_outlined)
                                : const Icon(Icons.thumb_down)
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
