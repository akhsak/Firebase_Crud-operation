
// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:crud_firebase/controller/homedonor_provider.dart';
import 'package:crud_firebase/model/donor.model.dart';
import 'package:crud_firebase/widget/text_formfield.dart';
import 'package:crud_firebase/widget/text_style.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class EditScreen extends StatefulWidget {
  DonorModel bloodgp;
  String id;
  EditScreen({super.key, required this.id, required this.bloodgp});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController groupController = TextEditingController();

  @override
  void initState() {
    super.initState();

    nameController.text = widget.bloodgp.name ;
    groupController.text = widget.bloodgp. group ;
    phoneController.text = widget.bloodgp.phone;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit details"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              customTextFormField(
                controller: nameController,
                labelText: 'Name',
              ),
              const SizedBox(
                height: 10,
              ),
              customTextFormField(
                controller: groupController,
                labelText: 'group',
              ),
              const SizedBox(
                height: 10,
              ),
              customTextFormField(
                controller: phoneController,
                labelText: 'phone no',
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 26, 58, 118)),
                  onPressed: () {
                    editStudent(context);
                  },
                  child: textPoppins(data: 'UPDATE', color: Colors.white))
            ],
          ),
        ),
      ),
    );
  }

  editStudent(
    BuildContext context,
  ) async {
    final pro = Provider.of<DonorProvider>(context, listen: false);

    try {
      final editedName = nameController.text;
      final editedPhone = phoneController.text;
      final editedgroup = groupController.text;
      final existingImage = widget.bloodgp.image;
     // final existingEventType = widget.bloodgp.group;
      // Update image URL in Firestore


      final updatedstudent= DonorModel(
        name: editedName, 
       phone: editedPhone,
         group: editedgroup,
         image: existingImage);
       pro.updateStudent(widget.id, updatedstudent);
      // final updatedstudent = DonorModel(
      //     name: editedName,
      //    // phone: editedPhone,
      //     image: existingImage,
      //     group: existingEventType);

      // pro.updateStudent(widget.id, updatedstudent);

      Navigator.pop(context);
    } catch (e) {
      log("Error updating student: $e");
    }
  }
}



