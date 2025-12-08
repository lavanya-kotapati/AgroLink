import 'package:flutter/material.dart';
import 'package:make_my_idea/constants/app_colors.dart';
import 'package:make_my_idea/constants/text_Style_utility.dart';
import 'package:make_my_idea/global_responsive_functions.dart';

class formFillingPage extends StatefulWidget {
  @override
  State<formFillingPage> createState() => _formFillingPageState();
}

class _formFillingPageState extends State<formFillingPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _contactController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  final _gstController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _contactController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _gstController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Process data
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Processing Data')));
      // Here you would typically send the data to a server or bloc
      print('Name: ${_nameController.text}');
      print('Contact: ${_contactController.text}');
      print('Email: ${_emailController.text}');
      print('Address: ${_addressController.text}');
      print('GST: ${_gstController.text}');
      print('Description: ${_descriptionController.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondaryGreen,
        title: Text(
          "Become A Seller..",
          style: textStyleUtility().bold(context, 32, AppColors.black),
        ),
      ),
      body: Container(
        color: AppColors.silver,
        padding: EdgeInsets.all(buildWidth(context, 20)),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField(
                context,
                controller: _nameController,
                label: 'Supplier Name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter supplier name';
                  }
                  return null;
                },
              ),
              SizedBox(height: buildHeight(context, 20)),
              _buildTextField(
                context,
                controller: _contactController,
                label: 'Contact Number',
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter contact number';
                  }
                  return null;
                },
              ),
              SizedBox(height: buildHeight(context, 20)),
              _buildTextField(
                context,
                controller: _emailController,
                label: 'Email Address',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter email address';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: buildHeight(context, 20)),
              _buildTextField(
                context,
                controller: _addressController,
                label: 'Address',
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter address';
                  }
                  return null;
                },
              ),
              SizedBox(height: buildHeight(context, 20)),
              _buildTextField(
                context,
                controller: _gstController,
                label: 'GST Number (Optional)',
              ),
              SizedBox(height: buildHeight(context, 20)),
              _buildTextField(
                context,
                controller: _descriptionController,
                label: 'Description / Category',
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter description';
                  }
                  return null;
                },
              ),
              SizedBox(height: buildHeight(context, 40)),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryGreen,
                  padding: EdgeInsets.symmetric(
                    vertical: buildHeight(context, 15),
                  ),
                ),
                child: Text(
                  'Submit',
                  style: textStyleUtility().bold(context, 24, Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    BuildContext context, {
    required TextEditingController controller,
    required String label,
    TextInputType? keyboardType,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: textStyleUtility().regular(context, 18, AppColors.black),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: buildWidth(context, 20),
          vertical: buildHeight(context, 15),
        ),
      ),
      style: textStyleUtility().regular(context, 18, AppColors.black),
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: validator,
    );
  }
}
