import 'package:flutter/material.dart';
import 'package:make_my_idea/constants/app_colors.dart';
import 'package:make_my_idea/global_responsive_functions.dart';

class FormFill extends StatefulWidget {
  @override
  State<FormFill> createState() => _FormFillState();
}

class _FormFillState extends State<FormFill> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _mobileNumberController = TextEditingController();
  String? default_category_value = "Farmer";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Become A Supplier"),
        centerTitle: true,
        backgroundColor: AppColors.greenBackground,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.celestePolverePowdery,
          child: Column(
            children: [
              SizedBox(height: buildHeight(context, 35)),
              Padding(
                padding: EdgeInsets.all(buildHeight(context, 20)),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: "Enter Your Full Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                      SizedBox(height: buildHeight(context, 15)),
                      TextFormField(
                        controller: _mobileNumberController,
                        decoration: InputDecoration(
                          labelText: "Enter Your Mobile Number",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                      SizedBox(height: buildHeight(context, 15)),
                      DropdownButtonFormField(
                        initialValue: default_category_value,
                        decoration: InputDecoration(
                          labelText: "Select Your Category",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        dropdownColor: AppColors.tertiaryGreen,
                        items:
                            [
                              // DropdownMenuItem(
                              //   child: Text("Farmer"),
                              //   value: "Farmer",
                              // ),
                              // DropdownMenuItem(
                              //   child: Text("Retailer"),
                              //   value: "Retailer",
                              // ),
                              // DropdownMenuItem(
                              //   child: Text("WholeSaler"),
                              //   value: "Wholesaler",
                              // ),
                              "Farmer",
                              "Retailer",
                              "Wholesaler",
                            ].map((item) {
                              return DropdownMenuItem(
                                child: Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Text(item),
                                ),
                                value: item,
                              );
                            }).toList(),
                        onChanged: (value) {
                          setState(() {
                            default_category_value = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
