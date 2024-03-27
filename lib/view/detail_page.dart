// ignore_for_file: prefer_const_constructors, use_super_parameters

import 'package:crud_firebase/model/donor_model.dart';
import 'package:crud_firebase/widget/text_style.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final DonorModel donor;

  const DetailScreen({required this.donor, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:
              textPoppins(data: donor.name.toUpperCase(), color: Colors.white),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 217, 29, 29),
           leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  image: donor.image != null
                      ? DecorationImage(
                          image: NetworkImage(donor.image!),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
              ),
              SizedBox(height: 10),
              ListTile(
                title: Text(
                  "Name",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  donor.name,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                leading: Icon(
                  Icons.person,
                  color: Color.fromARGB(255, 217, 29, 29),
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                title: Text(
                  "Blood group",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  donor.group,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                leading: Icon(
                  Icons.group,
                  color: Color.fromARGB(255, 217, 29, 29),
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                title: Text(
                  "Phone No",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  donor.phone,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                leading: Icon(
                  Icons.phone,
                  color: Color.fromARGB(255, 217, 29, 29),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
