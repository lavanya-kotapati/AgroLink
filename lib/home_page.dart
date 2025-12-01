import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:make_my_idea/constants/app_images.dart';
import 'package:make_my_idea/constants/app_colors.dart';
import 'package:make_my_idea/constants/text_Style_utility.dart';
import 'package:make_my_idea/details_view_page.dart';
import 'package:make_my_idea/global_responsive_functions.dart';
import 'package:make_my_idea/side_drawer.dart';
import 'package:make_my_idea/wishlist_bloc/wishlist_bloc.dart';
import 'package:make_my_idea/wishlist_bloc/wishlist_event.dart';
import 'package:make_my_idea/wishlist_bloc/wishlist_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Map<String, dynamic> userData = {
    'name': 'Lavanya K',
    'email': 'kotapatilavanya03@gmail.com',
    'phone': '9990888786',
    'address': '12 yepinapi village, Kaligiri, Andhra Pradesh',
    'city': 'Kaligiri',
    'state': 'Andhra Pradesh',
    'zip': '524224',
  };
  List<Map<String, dynamic>> products = [
    {
      'name': 'Product 1',
      'price': 10,
      'image': AppImages.product1,
      'description':
          'Our Fresh and Organic Wheat is grown naturally on fertile farms using sustainable agricultural methods — completely free from pesticides, chemicals, or synthetic fertilizers. Each grain is carefully harvested, cleaned, and packed to preserve its natural nutrients and wholesome flavor.\n\nRich in fiber, protein, and essential minerals, this wheat is ideal for making soft chapatis, fluffy breads, wholesome baked goods, and hearty dishes. Its natural aroma and rich texture bring out the authentic taste of pure, farm-fresh wheat in every meal.',
      'total_quantity': 100,
      'details': {
        'seller_name': 'John Smith',
        'occupation': 'Farmer',
        'category': 'Grains',
        'unit': 'kg',
        'minimum_order': '5 kg',
        'location': 'Kaligiri, Andhra Pradesh',
        'phone_number': '9990888786',
        'email_id': 'example@gmail.com',
        'delivery': 'contact seller For Details',
      },
    },
    {
      'name': 'Product 2',
      'price': 15,
      'image': AppImages.product2,
      'description':
          'Our Fresh and Organic Wheat is grown naturally on fertile farms using sustainable agricultural methods — completely free from pesticides, chemicals, or synthetic fertilizers. Each grain is carefully harvested, cleaned, and packed to preserve its natural nutrients and wholesome flavor.\n\nRich in fiber, protein, and essential minerals, this wheat is ideal for making soft chapatis, fluffy breads, wholesome baked goods, and hearty dishes. Its natural aroma and rich texture bring out the authentic taste of pure, farm-fresh wheat in every meal.',
      'total_quantity': 200,
      'details': {
        'seller_name': 'John Doe',
        'occupation': 'Farmer',
        'category': 'Grains',
        'unit': 'kg',
        'minimum_order': '2 kg',
        'location': 'Kaligiri, Andhra Pradesh',
        'phone_number': '9990888786',
        'email_id': 'example@gmail.com',
        'delivery': 'contact seller For Details',
      },
    },
    {
      'name': 'Product 3',
      'price': 30,
      'image': AppImages.product2,
      'description':
          'Our Fresh and Organic Wheat is grown naturally on fertile farms using sustainable agricultural methods — completely free from pesticides, chemicals, or synthetic fertilizers. Each grain is carefully harvested, cleaned, and packed to preserve its natural nutrients and wholesome flavor.\n\nRich in fiber, protein, and essential minerals, this wheat is ideal for making soft chapatis, fluffy breads, wholesome baked goods, and hearty dishes. Its natural aroma and rich texture bring out the authentic taste of pure, farm-fresh wheat in every meal.',
      'total_quantity': 300,
      'details': {
        'seller_name': 'John Doe',
        'occupation': 'Farmer',
        'category': 'Grains',
        'unit': 'kg',
        'minimum_order': '2 kg',
        'location': 'Kaligiri, Andhra Pradesh',
        'phone_number': '9990888786',
        'email_id': 'example@gmail.com',
        'delivery': 'contact seller For Details',
      },
    },
    {
      'name': 'Product 4',
      'price': 10,
      'image': AppImages.product1,
      'description':
          'Our Fresh and Organic Wheat is grown naturally on fertile farms using sustainable agricultural methods — completely free from pesticides, chemicals, or synthetic fertilizers. Each grain is carefully harvested, cleaned, and packed to preserve its natural nutrients and wholesome flavor.\n\nRich in fiber, protein, and essential minerals, this wheat is ideal for making soft chapatis, fluffy breads, wholesome baked goods, and hearty dishes. Its natural aroma and rich texture bring out the authentic taste of pure, farm-fresh wheat in every meal.',
      'total_quantity': 400,
      'details': {
        'seller_name': 'John Doe',
        'occupation': 'Farmer',
        'category': 'Grains',
        'unit': 'kg',
        'minimum_order': '3 kg',
        'location': 'Kaligiri, Andhra Pradesh',
        'phone_number': '9990888786',
        'email_id': 'example@gmail.com',
        'delivery': 'contact seller For Details',
      },
    },
    {
      'name': 'Product 5',
      'price': 60,
      'image': AppImages.product1,
      'description':
          'Our Fresh and Organic Wheat is grown naturally on fertile farms using sustainable agricultural methods — completely free from pesticides, chemicals, or synthetic fertilizers. Each grain is carefully harvested, cleaned, and packed to preserve its natural nutrients and wholesome flavor.\n\nRich in fiber, protein, and essential minerals, this wheat is ideal for making soft chapatis, fluffy breads, wholesome baked goods, and hearty dishes. Its natural aroma and rich texture bring out the authentic taste of pure, farm-fresh wheat in every meal.',
      'total_quantity': 500,
      'details': {
        'seller_name': 'John Smith',
        'occupation': 'Retailer',
        'category': 'Grains',
        'unit': 'kg',
        'minimum_order': '6 kg',
        'location': 'Kaligiri, Andhra Pradesh',
        'phone_number': '9990888786',
        'email_id': 'example@gmail.com',
        'delivery': 'contact seller For Details',
      },
    },
    {
      'name': 'Product 6',
      'price': 90,
      'image': AppImages.product2,
      'description':
          'Our Fresh and Organic Wheat is grown naturally on fertile farms using sustainable agricultural methods — completely free from pesticides, chemicals, or synthetic fertilizers. Each grain is carefully harvested, cleaned, and packed to preserve its natural nutrients and wholesome flavor.\n\nRich in fiber, protein, and essential minerals, this wheat is ideal for making soft chapatis, fluffy breads, wholesome baked goods, and hearty dishes. Its natural aroma and rich texture bring out the authentic taste of pure, farm-fresh wheat in every meal.',
      'total_quantity': 600,
      'details': {
        'seller_name': 'John Doe',
        'occupation': 'Farmer',
        'category': 'Grains',
        'unit': 'kg',
        'minimum_order': '5 kg',
        'location': 'Kaligiri, Andhra Pradesh',
        'phone_number': '9990888786',
        'email_id': 'example@gmail.com',
        'delivery': 'contact seller For Details',
      },
    },
    {
      'name': 'Product 7',
      'price': 40,
      'image': AppImages.product2,
      'description':
          'Fresh and organic wheat grown naturally without pesticides. Perfect for baking and cooking.',
      'total_quantity': 700,
      'details': {
        'seller_name': 'John Smith',
        'occupation': 'Farmer',
        'category': 'Grains',
        'unit': 'kg',
        'minimum_order': '7 kg',
        'location': 'Kaligiri, Andhra Pradesh',
        'phone_number': '9990888786',
        'email_id': 'example@gmail.com',
        'delivery': 'contact seller For Details',
      },
    },
    {
      'name': 'Product 8',
      'price': 70,
      'image': AppImages.product1,
      'description':
          'Fresh and organic wheat grown naturally without pesticides. Perfect for baking and cooking.',
      'total_quantity': 800,
      'details': {
        'seller_name': 'John Doe',
        'occupation': 'Retailer',
        'category': 'Grains',
        'unit': 'kg',
        'minimum_order': '8 kg',
        'location': 'Kaligiri, Andhra Pradesh',
        'phone_number': '9990888786',
        'email_id': 'example@gmail.com',
        'delivery': 'contact seller For Details',
      },
    },
  ];

  Map<String, bool> selectionStates = {
    'isSelectedHome': false,
    'isSelectedProfile': false,
    'isSelectedBecomeSupplier': false,
    'isSelectedSettings': false,
    'isSelectedHelpSupport': false,
    'isSelectedMyOrders': false,
    'isSelectedViewCart': false,
  };

  void handleSelectionChanged(String title) {
    setState(() {
      // Reset all selections
      selectionStates.updateAll((key, value) => false);

      // Set the selected item
      switch (title) {
        case 'Home':
          selectionStates['isSelectedHome'] = true;
          break;
        case 'Profile':
          selectionStates['isSelectedProfile'] = true;
          break;
        case 'Become a Supplier':
          selectionStates['isSelectedBecomeSupplier'] = true;
          break;
        case 'My Orders':
          selectionStates['isSelectedMyOrders'] = true;
          break;
        case 'View Cart':
          selectionStates['isSelectedViewCart'] = true;
          break;
        case 'Settings':
          selectionStates['isSelectedSettings'] = true;
          break;
        case 'Help & Support':
          selectionStates['isSelectedHelpSupport'] = true;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: SideDrawer.buildDrawer(
        context,
        userData,
        selectionStates,
        handleSelectionChanged,
      ),
      body: Column(
        children: [
          SideDrawer.buildHeader(context, userData, _scaffoldKey),
          SizedBox(height: buildHeight(context, 10)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                contentPadding: EdgeInsets.symmetric(vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
              onChanged: (value) {
                // Handle search logic here
                print('Searching: $value');
              },
            ),
          ),
          Expanded(
            child: Container(
              color: AppColors.tertiaryGreen,
              child: GridView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: buildWidth(context, 10),
                  mainAxisSpacing: buildHeight(context, 5),
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];

                  return BlocBuilder<WishlistBloc, WishlistState>(
                    builder: (context, wishlistState) {
                      final isInWishlist = wishlistState.wishlistItems.any(
                        (item) => item['name'] == product['name'],
                      );

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => DetailsViewPage(
                                    productData: {
                                      'name': product['name'],
                                      'price': product['price'],
                                      'image': product['image'],
                                      'description': product['description'],
                                      'total_quantity':
                                          product['total_quantity'],
                                      'details': product['details'],
                                    },
                                  ),
                            ),
                          );
                        },
                        child: Container(
                          color: Colors.white,
                          child: Stack(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Image.asset(
                                      product['image'],
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 8,
                                      top: 4,
                                      bottom: 2,
                                    ),
                                    child: Text(
                                      product['name'],
                                      style: textStyleUtility().semiBold(
                                        context,
                                        20,
                                        Colors.black,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 8,
                                      bottom: 4,
                                    ),
                                    child: Text(
                                      '₹ ${product['price'].toString()}/- per kg',
                                      style: textStyleUtility().semiBold(
                                        context,
                                        16,
                                        Colors.black,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                top: 8,
                                right: 8,
                                child: IconButton(
                                  onPressed: () {
                                    if (isInWishlist) {
                                      context.read<WishlistBloc>().add(
                                        RemoveFromWishlistEvent(
                                          productData: product,
                                        ),
                                      );
                                    } else {
                                      context.read<WishlistBloc>().add(
                                        AddToWishlistEvent(
                                          productData: product,
                                        ),
                                      );
                                    }
                                  },
                                  icon: Icon(
                                    isInWishlist
                                        ? Icons.favorite
                                        : Icons.favorite_border_outlined,
                                    color:
                                        isInWishlist
                                            ? Colors.red
                                            : Colors.black,
                                    size: buildImageSize(context, 30),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.silver,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        selectedLabelStyle: textStyleUtility().semiBold(
          context,
          20,
          Colors.black,
        ),
        unselectedLabelStyle: textStyleUtility().semiBold(
          context,
          16,
          Colors.black,
        ),
        selectedIconTheme: IconThemeData(color: Colors.black),
        unselectedIconTheme: IconThemeData(color: Colors.black),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store, size: 30),
            label: 'Become a Supplier',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, size: 30),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help, size: 30),
            label: 'Help & Support',
          ),
        ],
      ),
    );
  }
}
