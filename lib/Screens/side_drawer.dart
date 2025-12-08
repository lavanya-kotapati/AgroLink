import 'package:flutter/material.dart';
import 'package:make_my_idea/Screens/become_supplier/Form_filling_page.dart';
import 'package:make_my_idea/constants/app_images.dart';
import 'package:make_my_idea/constants/app_colors.dart';
import 'package:make_my_idea/constants/text_Style_utility.dart';
import 'package:make_my_idea/global_responsive_functions.dart';
import 'package:make_my_idea/Screens/wishlist_items.dart';
import 'package:make_my_idea/Screens/become_supplier/form_fill.dart';

class SideDrawer {
  static Widget buildHeader(
    BuildContext context,
    Map<String, dynamic> userData,
    GlobalKey<ScaffoldState> scaffoldKey,
  ) {
    return Container(
      height: buildHeight(context, 100),
      color: AppColors.silver,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                AppImages.logo2,
                height: buildHeight(context, 140),
                width: buildWidth(context, 140),
              ),
              SizedBox(width: buildWidth(context, 20)),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Hi! Welcome ',
                      style: textStyleUtility().bold(context, 28, Colors.black),
                    ),
                    TextSpan(
                      text: userData['name'],
                      style: textStyleUtility().bold(context, 32, Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WishlistItems()),
                  );
                },
                child: Icon(
                  Icons.favorite_border_outlined,
                  size: buildHeight(context, 25),
                ),
              ),
              SizedBox(width: buildWidth(context, 28)),
              GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.notifications_active_outlined,
                  size: buildHeight(context, 25),
                ),
              ),
              SizedBox(width: buildWidth(context, 28)),
              GestureDetector(
                onTap: () {
                  scaffoldKey.currentState?.openEndDrawer();
                },
                child: CircleAvatar(
                  backgroundImage: AssetImage(AppImages.profile),
                  radius: buildHeight(context, 22.5),
                ),
              ),
              SizedBox(width: buildWidth(context, 20)),
            ],
          ),
        ],
      ),
    );
  }

  static Widget buildDrawer(
    BuildContext context,
    Map<String, dynamic> userData,
    Map<String, bool> selectionStates,
    Function(String) onSelectionChanged,
  ) {
    return Drawer(
      child: Container(
        color: AppColors.lightBlue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                SizedBox(height: buildHeight(context, 20)),
                CircleAvatar(
                  backgroundImage: AssetImage(AppImages.profile),
                  radius: buildHeight(context, 60.5),
                ),
                Text(
                  userData['name'],
                  style: textStyleUtility().bold(context, 38, Colors.black),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.email, size: 15, color: Colors.black),
                    SizedBox(
                      width: buildWidth(context, 5),
                    ), // space between icon and text
                    Text(
                      userData['email'],
                      style: textStyleUtility().semiBold(
                        context,
                        16,
                        Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: buildHeight(context, 20)),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDrawerItem(
                  context,
                  'Home',
                  Icons.home,
                  selectionStates['isSelectedHome'] ?? false,
                  () => onSelectionChanged('Home'),
                ),
                _buildDrawerItem(
                  context,
                  'Profile',
                  Icons.person,
                  selectionStates['isSelectedProfile'] ?? false,
                  () => onSelectionChanged('Profile'),
                ),

                _buildDrawerItem(
                  context,
                  'Become a Supplier',
                  Icons.store,
                  selectionStates['isSelectedBecomeSupplier'] ?? false,
                  () {
                    onSelectionChanged('Become a Supplier');
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => formFillingPage(),
                    //   ),
                    // );
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FormFill()),
                    );
                  },
                ),

                _buildDrawerItem(
                  context,
                  'My Orders',
                  Icons.shopping_cart,
                  selectionStates['isSelectedMyOrders'] ?? false,
                  () => onSelectionChanged('My Orders'),
                ),
                _buildDrawerItem(
                  context,
                  'View Cart',
                  Icons.shopping_cart,
                  selectionStates['isSelectedViewCart'] ?? false,
                  () => onSelectionChanged('View Cart'),
                ),
                _buildDrawerItem(
                  context,
                  'Settings',
                  Icons.settings,
                  selectionStates['isSelectedSettings'] ?? false,
                  () => onSelectionChanged('Settings'),
                ),
                _buildDrawerItem(
                  context,
                  'Help & Support',
                  Icons.build_outlined,
                  selectionStates['isSelectedHelpSupport'] ?? false,
                  () => onSelectionChanged('Help & Support'),
                ),
                SizedBox(height: buildHeight(context, 10)),
                _buildLogoutItem(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildDrawerItem(
    BuildContext context,
    String title,
    IconData icon,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: buildHeight(context, 40),
        decoration: BoxDecoration(
          color: !isSelected ? AppColors.lightBlue : Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: Colors.black),
            SizedBox(width: buildWidth(context, 5)),
            Text(
              title,
              textAlign: TextAlign.start,
              style: textStyleUtility().semiBold(context, 30, Colors.black),
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios, size: 20, color: Colors.black),
            SizedBox(width: buildWidth(context, 15)),
          ],
        ),
      ),
    );
  }

  static Widget _buildLogoutItem(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //next page for logout
      },
      child: Container(
        height: buildHeight(context, 40),
        decoration: BoxDecoration(color: AppColors.lightBlue),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.logout, size: 30, color: Colors.black),
            SizedBox(width: buildWidth(context, 5)),
            Text(
              'Logout',
              textAlign: TextAlign.start,
              style: textStyleUtility().semiBold(context, 30, Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
