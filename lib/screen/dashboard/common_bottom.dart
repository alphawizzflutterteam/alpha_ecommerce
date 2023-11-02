import 'package:alpha_ecommerce_18oct/screen/cart/cart.dart';
import 'package:alpha_ecommerce_18oct/screen/category/category.dart';
import 'package:alpha_ecommerce_18oct/screen/home/home.dart';
import 'package:alpha_ecommerce_18oct/screen/profile/profile.dart';
import 'package:alpha_ecommerce_18oct/screen/vendor/vendor.dart';
import 'package:flutter/material.dart';

import '../../helper/color.dart';

class BottomNavPage extends StatefulWidget {
  final int? index;
  const BottomNavPage({Key? key, this.index}) : super(key: key);
  @override
  _BottomNavPageState createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int _currentIndex = 2;

  final List<Widget> _pages = [
    const Cart(),
    const AllCategory(),
    Home(),
    Vendor(),
    Profile(),
  ];

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      _currentIndex = widget.index!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      body: _pages[_currentIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            canvasColor: colors.textFieldBG,
        ),
        child: BottomNavigationBar(
          elevation: 0.0,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedLabelStyle: const TextStyle(fontSize: 12),
          selectedItemColor: colors.textColor,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_sharp),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            // Add items for your new tabs
            BottomNavigationBarItem(
              icon: Icon(Icons.shop),
              label: 'Vendor',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
