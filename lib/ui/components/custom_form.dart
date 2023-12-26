import 'package:flutter/material.dart';
import 'package:retail_intel_v2/constants/constants.dart';
import 'package:retail_intel_v2/ui/style/colors.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({super.key});

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.white,
                contentPadding: const EdgeInsets.only(
                  left: 40.0,
                  right: 5.0,
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                // enabledBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(30.0),
                //   borderSide: BorderSide(color: AppColors.white),
                // ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(color: AppColors.white),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: iconColor,
                ),
                hintText: 'Search...',
                hintStyle: const TextStyle(
                  color: AppColors.secondary,
                  fontSize: 14.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
