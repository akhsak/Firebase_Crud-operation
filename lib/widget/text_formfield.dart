import 'package:crud_firebase/controller/add_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

Widget customTextFormField(
    {controller,
    labelText,
    maxlength,
    List<TextInputFormatter>? inputFormatters,
    TextInputType? keyboardType,
   })
    {
  return TextFormField(
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Value is empty';
      } else {
        return null;
      }
    },
    controller: controller,
    keyboardType: keyboardType,
    inputFormatters: inputFormatters,
    maxLength: maxlength,
    decoration: InputDecoration(
      // Color.fromARGB(255, 26, 58, 118)
      labelStyle:
          const TextStyle(color: const Color.fromARGB(255, 26, 58, 118)),
      labelText: labelText,
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: const Color.fromARGB(255, 26, 58, 118)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: const Color.fromARGB(255, 26, 58, 118)),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
      ),
    ),
  );
}

Widget dropDown(AddProvider addProvider) {
  return Consumer<AddProvider>(builder: (context, addValue, child) {
    return DropdownButtonFormField(
      validator: (value) {
        if (value == null) {
          return "Choose a blood group";
        } else {
          return null;
        }
      },
      decoration: const InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: const Color.fromARGB(255, 26, 58, 118))),
        border: OutlineInputBorder(),
        labelText: 'Blood group',
        labelStyle: TextStyle(color: const Color.fromARGB(255, 26, 58, 118)),
      ),
      value: addValue.selectedValue,
      items: <String>['A+', 'B+', 'O+', 'O-', 'AB-', 'AB+']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        if (newValue != null) {
          addValue.setSelectedValue(newValue);
        }
      },
    );
  });
}

