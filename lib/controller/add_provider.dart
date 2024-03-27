import 'dart:io';
import 'package:crud_firebase/controller/home_donor_provider.dart';
import 'package:crud_firebase/model/donor_model.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController groupController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  String? selectedValue;
  final formKey = GlobalKey<FormState>();

  File? selectedImage;
  ImagePicker imagePicker = ImagePicker();

  void setImage(ImageSource source) async {
    final pickedImage = await imagePicker.pickImage(source: source);

    selectedImage = pickedImage != null ? File(pickedImage.path) : null;
    notifyListeners();
  }

  void setSelectedValue(String val) {
    selectedValue = val;
    notifyListeners();
  }

  void clearTextField() {
    nameController.clear();
    groupController.clear();
    phoneController.clear();
    selectedValue = null;
  }

  void addStudent(BuildContext context) {
    final donorProvider = Provider.of<DonorProvider>(context, listen: false);

    final name = nameController.text;
    final phone = phoneController.text;

    donorProvider.imageAdder(File(selectedImage!.path));

    final donor = DonorModel(
        phone: phone,
        name: name,
        image: donorProvider.downloadurl,
        group: selectedValue ?? '');
    donorProvider.addDonor(donor);
    clearTextField();
  }
}
