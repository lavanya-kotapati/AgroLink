import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:make_my_idea/constants/app_colors.dart';
import 'package:make_my_idea/constants/app_images.dart';
import 'package:make_my_idea/constants/text_Style_utility.dart';
import 'package:make_my_idea/global_responsive_functions.dart';
import 'package:make_my_idea/wishlist_bloc/wishlist_bloc.dart';
import 'package:make_my_idea/wishlist_bloc/wishlist_event.dart';

class DetailsViewPage extends StatefulWidget {
  const DetailsViewPage({super.key, required this.productData});
  final Map<String, dynamic> productData;

  @override
  State<DetailsViewPage> createState() => _DetailsViewPageState();
}

class _DetailsViewPageState extends State<DetailsViewPage> {
  Map<String, dynamic> productData = {};

  @override
  void initState() {
    super.initState();
    productData = widget.productData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(
                    productData['image'],
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: buildHeight(context, 20),
                    left: buildWidth(context, 30),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                        size: buildImageSize(context, 50),
                      ),
                    ),
                  ),
                  Positioned(
                    top: buildHeight(context, 20),
                    right: buildWidth(context, 35),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.read<WishlistBloc>().add(AddToWishlistEvent(productData: productData));
                          },
                          child: Icon(
                            Icons.favorite_border_outlined,
                            color: Colors.black,
                            size: buildImageSize(context, 50),
                          ),
                        ),
                        SizedBox(width: buildWidth(context, 30)),
                        Icon(
                          Icons.share,
                          color: Colors.black,
                          size: buildImageSize(context, 50),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: buildWidth(context, 20),
                  right: buildWidth(context, 20),
                  top: buildHeight(context, 20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productData['name'] ?? 'Product Name',
                      style: textStyleUtility().bold(context, 40, Colors.black),
                    ),
                    SizedBox(height: buildHeight(context, 10)),
                    Container(
                      height: buildHeight(context, 60),
                      //
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          buildWidth(context, 10),
                        ),
                        color: AppColors.secondaryGreen,
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: buildWidth(context, 15),
                                ),
                                child: Text(
                                  'Price',
                                  style: textStyleUtility().regular(
                                    context,
                                    22,
                                    AppColors.steelGrey,
                                  ),
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.only(
                                  right: buildWidth(context, 15),
                                ),
                                child: Text(
                                  'Available',
                                  style: textStyleUtility().regular(
                                    context,
                                    22,
                                    AppColors.steelGrey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: buildWidth(context, 15),
                                ),
                                child: Text(
                                  '₹ ${productData['price']?.toString() ?? '0'}/- per kg',
                                  style: textStyleUtility().bold(
                                    context,
                                    26,
                                    AppColors.darkGreen,
                                  ),
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.only(
                                  right: buildWidth(context, 15),
                                ),
                                child: Text(
                                  '${productData['total_quantity']?.toString() ?? '0'} kg',
                                  style: textStyleUtility().bold(
                                    context,
                                    26,
                                    AppColors.darkGreen,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: buildWidth(context, 20),
                  top: buildHeight(context, 10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description',
                      style: textStyleUtility().semiBold(
                        context,
                        30,
                        Colors.black,
                      ),
                    ),
                    Text(
                      productData['description'] ??
                          'Product Description Not Available',
                      style: textStyleUtility().regular(
                        context,
                        26,
                        Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: buildHeight(context, 10)),
              Padding(
                padding: EdgeInsets.only(
                  left: buildWidth(context, 20),
                  right: buildWidth(context, 20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Seller Information',
                      style: textStyleUtility().semiBold(
                        context,
                        30,
                        Colors.black,
                      ),
                    ),
                    SizedBox(height: buildHeight(context, 10)),
                    Container(
                      height: buildHeight(context, 150),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          buildWidth(context, 10),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.5),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: buildWidth(context, 10)),
                          Image.asset(AppImages.profile),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: buildHeight(context, 10),
                                  left: buildWidth(context, 10),
                                ),
                                child: Text(
                                  '${productData['details']['seller_name'] ?? ''}',
                                  style: textStyleUtility().semiBold(
                                    context,
                                    28,
                                    Colors.black,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: buildWidth(context, 65),
                                ),
                                child: Text(
                                  '- ${productData['details']['occupation'] ?? ''}',
                                  style: textStyleUtility().regular(
                                    context,
                                    28,
                                    Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(height: buildHeight(context, 5)),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: buildWidth(context, 10),
                                  bottom: buildHeight(context, 5),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.email_rounded,
                                      color: Colors.black,
                                      size: buildImageSize(context, 25),
                                    ),
                                    Text(
                                      ' ${productData['details']['email_id'] ?? ''}',
                                      style: textStyleUtility().regular(
                                        context,
                                        26,
                                        Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: buildWidth(context, 10),
                                  bottom: buildHeight(context, 5),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.phone_rounded,
                                      color: Colors.black,
                                      size: buildImageSize(context, 25),
                                    ),
                                    Text(
                                      ' +91 ${productData['details']['phone_number'] ?? ''}',
                                      style: textStyleUtility().regular(
                                        context,
                                        26,
                                        Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: buildWidth(context, 10),
                                  bottom: buildHeight(context, 5),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_rounded,
                                      color: Colors.black,
                                      size: buildImageSize(context, 25),
                                    ),
                                    Text(
                                      ' ${productData['details']['location'] ?? ''}',
                                      style: textStyleUtility().regular(
                                        context,
                                        26,
                                        Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: buildWidth(context, 20),
                  right: buildWidth(context, 20),
                  top: buildHeight(context, 18),
                ),
                child: Text(
                  'Details',
                  style: textStyleUtility().semiBold(context, 32, Colors.black),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: buildWidth(context, 20),
                  right: buildWidth(context, 20),
                  top: buildHeight(context, 5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Category',
                          style: textStyleUtility().regular(
                            context,
                            24,
                            Colors.black,
                          ),
                        ),
                        Text(
                          '${productData['details']['category'] ?? ''}',
                          style: textStyleUtility().semiBold(
                            context,
                            24,
                            Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Unit',
                          style: textStyleUtility().regular(
                            context,
                            24,
                            Colors.black,
                          ),
                        ),
                        Text(
                          '${productData['details']['unit'] ?? ''}',
                          style: textStyleUtility().semiBold(
                            context,
                            24,
                            Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Minimum Order',
                          style: textStyleUtility().regular(
                            context,
                            24,
                            Colors.black,
                          ),
                        ),
                        Text(
                          '${productData['details']['minimum_order'] ?? ''}',
                          style: textStyleUtility().semiBold(
                            context,
                            24,
                            Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivery',
                          style: textStyleUtility().regular(
                            context,
                            24,
                            Colors.black,
                          ),
                        ),
                        Text(
                          '${productData['details']['delivery'] ?? ''}',
                          style: textStyleUtility().semiBold(
                            context,
                            24,
                            Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: buildHeight(context, 100)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: buildHeight(context, 80),
        padding: EdgeInsets.symmetric(horizontal: buildWidth(context, 40)),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.8),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: buildHeight(context, 40),
              width: buildWidth(context, 600),
              decoration: BoxDecoration(
                color: AppColors.greenBackground,
                borderRadius: BorderRadius.circular(buildWidth(context, 10)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.phone_rounded,
                    color: Colors.white,
                    size: buildImageSize(context, 32),
                  ),
                  SizedBox(width: buildWidth(context, 8)),
                  Text(
                    'Contact Seller',
                    style: textStyleUtility().semiBold(
                      context,
                      28,
                      Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: buildHeight(context, 40),
              width: buildWidth(context, 600),
              decoration: BoxDecoration(
                color: AppColors.greenBackground,
                borderRadius: BorderRadius.circular(buildWidth(context, 10)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.message_rounded,
                    color: Colors.white,
                    size: buildImageSize(context, 32),
                  ),
                  SizedBox(width: buildWidth(context, 8)),
                  Text(
                    'Send Message',
                    style: textStyleUtility().semiBold(
                      context,
                      28,
                      Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
