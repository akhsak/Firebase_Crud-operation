import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_firebase/controller/homedonor_provider.dart';
import 'package:crud_firebase/model/donor.model.dart';
import 'package:crud_firebase/view/add_page.dart';
import 'package:crud_firebase/view/detail_page.dart';
import 'package:crud_firebase/view/edit_page.dart';
import 'package:crud_firebase/widget/text_style.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 10),
            child: textTitle(data: 'Home', size: 30),
          ),
          Expanded(
            child: Consumer<DonorProvider>(
              builder: (context, value, child) => StreamBuilder(
                stream: value.getData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(child: Text('Snapshot has error'));
                  } else {
                    List<QueryDocumentSnapshot<DonorModel>> donorDoc =
                        snapshot.data?.docs ?? [];
                    return ListView.builder(
                      itemCount: donorDoc.length,
                      itemBuilder: (context, index) {
                        final data = donorDoc[index].data();
                        final id = donorDoc[index].id;
                        return Card(
                          elevation: 5,
                          margin: const EdgeInsets.all(8),
                          child: ListTile(
                            title: Text(
                              data.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Group: ${data.group}",
                                  style: const TextStyle(
                                    color: const Color.fromARGB(255, 26, 58, 118),
                                  ),
                                ),
                              ],
                            ),
                            leading: CircleAvatar(
                              backgroundColor:
                                  const Color.fromARGB(255, 26, 58, 118),
                              backgroundImage: NetworkImage(data.image ?? ''),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Color.fromARGB(255, 26, 58, 118),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => EditScreen(
                                          id: id,
                                          bloodgp: data,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    value.deleteStudent(id);
                                  },
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            DetailScreen(donor: data),
                                      ),
                                    );
                                  },
                                  icon: const Icon(Icons.arrow_forward_ios),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddScreen(),
            ),
          );
        },
        backgroundColor: Color.fromARGB(255, 217, 29, 29),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
