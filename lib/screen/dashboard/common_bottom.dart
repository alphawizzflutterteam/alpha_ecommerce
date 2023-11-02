import 'package:flutter/material.dart';
import '../../helper/color.dart';
import '../../helper/images.dart';
import '../cart/cart.dart';
import '../category/category.dart';
import '../home/home.dart';
import '../profile/profile.dart';
import '../vendor/vendor.dart';

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
    const Home(),
    const Vendor(),
    const Profile(),
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
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Images.bgTab),
            fit: BoxFit.cover,
          ),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.transparent,
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
      ),
    );
  }
}
