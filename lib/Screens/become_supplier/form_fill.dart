import 'package:flutter/material.dart';
import 'package:make_my_idea/constants/app_colors.dart';
import 'package:make_my_idea/constants/global_responsive_functions.dart';

class FormFill extends StatefulWidget {
  @override
  State<FormFill> createState() => _FormFillState();
}

class _FormFillState extends State<FormFill> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _mobileNumberController = TextEditingController();
  final _addressController = TextEditingController();
  final _quantityController = TextEditingController();
  final _unitPriceController = TextEditingController();
  final _productNameController = TextEditingController();
  String default_role_value = "Farmer";
  String? default_category_value = "Grains";
  String default_weight_value = "kg";
  String default_delivery_type = "Buyer will pick up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Become A Supplier"),
        centerTitle: true,
        backgroundColor: AppColors.greenBackground,
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
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
                        keyboardType: TextInputType.numberWithOptions(),
                        decoration: InputDecoration(
                          labelText: "Enter Your Mobile Number",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                      SizedBox(height: buildHeight(context, 15)),
                      DropdownButtonFormField(
                        value: default_role_value,
                        decoration: InputDecoration(
                          labelText: "Select Your Role",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        dropdownColor: AppColors.tertiaryGreen,
                        items:
                            ["Farmer", "Retailer", "Wholesaler"].map((item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Text(item),
                                ),
                              );
                            }).toList(),
                        onChanged: (value) {
                          setState(() {
                            default_role_value = value!;
                          });
                        },
                      ),
                      SizedBox(height: buildHeight(context, 15)),
                      TextFormField(
                        controller: _addressController,
                        decoration: InputDecoration(
                          labelText: "Enter Your Address",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                      SizedBox(height: buildHeight(context, 15)),
                      TextFormField(
                        controller: _productNameController,
                        decoration: InputDecoration(
                          labelText: "Enter Product Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                      SizedBox(height: buildHeight(context, 15)),
                      DropdownButtonFormField(
                        initialValue: default_category_value,
                        dropdownColor: AppColors.celestePolverePowdery,
                        decoration: InputDecoration(
                          labelText: "Select The Category",
                        ),
                        items:
                            [
                              'Vegetables',
                              'Fruits',
                              'Grains',
                              'Pulses',
                              'Dairy',
                              'Seeds',
                              'Others',
                            ].map((item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Text(item),
                                ),
                              );
                            }).toList(),
                        onChanged: (value) {
                          setState(() {
                            default_category_value = value!;
                          });
                        },
                      ),
                      SizedBox(height: buildHeight(context, 15)),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: TextFormField(
                              controller: _quantityController,
                              keyboardType: TextInputType.numberWithOptions(),
                              decoration: InputDecoration(
                                labelText: "Enter Available Quantity",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: buildWidth(context, 40)),
                          Expanded(
                            flex: 1,
                            child: DropdownButtonFormField(
                              initialValue: default_weight_value,
                              dropdownColor: AppColors.celestePolverePowdery,
                              decoration: InputDecoration(labelText: "Weight"),
                              items:
                                  [
                                    'kg',
                                    'quintal',
                                    'tonne',
                                    'litre',
                                    'piece',
                                    'bag',
                                  ].map((item) {
                                    return DropdownMenuItem<String>(
                                      value: item,
                                      child: Padding(
                                        padding: const EdgeInsets.all(2),
                                        child: Text(item),
                                      ),
                                    );
                                  }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  default_weight_value = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: buildHeight(context, 15)),
                      TextFormField(
                        controller: _unitPriceController,
                        keyboardType: TextInputType.numberWithOptions(),
                        decoration: InputDecoration(
                          labelText: "Base Price per Unit",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                      SizedBox(height: buildHeight(context, 15)),
                      DropdownButtonFormField(
                        initialValue: default_delivery_type,
                        dropdownColor: AppColors.celestePolverePowdery,
                        decoration: InputDecoration(
                          labelText: "Delivery Options",
                        ),
                        items:
                            [
                              'Buyer will pick up',
                              'I can arrange transport',
                            ].map((item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Text(item),
                                ),
                              );
                            }).toList(),
                        onChanged: (value) {
                          setState(() {
                            default_delivery_type = value!;
                          });
                        },
                      ),

                      SizedBox(height: buildHeight(context, 40)),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.greenBackground,
                          shadowColor: AppColors.steelGrey,
                          elevation: 4,
                        ),
                        onPressed: () {},
                        child: Text("Submit Form"),
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
