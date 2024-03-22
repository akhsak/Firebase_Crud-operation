// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:crud_firebase/controller/add_provider.dart';
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

    nameController.text = widget.bloodgp.name;
    groupController.text = widget.bloodgp.group;
    phoneController.text = widget.bloodgp.phone;
  }

  @override
  Widget build(BuildContext context) {
    final addProvider = Provider.of<AddProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: textTitle(data: 'Edit details', size: 25),
        backgroundColor:const Color.fromARGB(255, 217, 29, 29),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: addProvider.formKey,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                customTextFormField(
                  controller: nameController,
                  labelText: 'Name',
                  message: 'Enter the name',
                ),
                const SizedBox(
                  height: 15,
                ),
                customTextFormField(
                    controller: groupController,
                    labelText: 'group',
                    message: 'Enter the blood group'),
                const SizedBox(
                  height: 15,
                ),
                customTextFormField(
                    controller: phoneController,
                    labelText: 'phone no',
                    message: 'Enter the phone no'),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 217, 29, 29)),
                    onPressed: () {
                      if (addProvider.formKey.currentState!.validate()) {
                        editDonor(context);
                      }
                    },
                    child: textPoppins(data: 'UPDATE', color: Colors.white))
              ],
            ),
          ),
        ),
      ),
    );
  }

  editDonor(
    BuildContext context,
  ) async {
    final pro = Provider.of<DonorProvider>(context, listen: false);

    try {
      final editedName = nameController.text;
      final editedPhone = phoneController.text;
      final editedgroup = groupController.text;
      final existingImage = widget.bloodgp.image;

      // Update image URL in Firestore

      final updateddonor = DonorModel(
          name: editedName,
          phone: editedPhone,
          group: editedgroup,
          image: existingImage);
      pro.updateDonor(widget.id, updateddonor);

      Navigator.pop(context);
    } catch (e) {
      log("Error updating donors: $e");
    }
  }
}
