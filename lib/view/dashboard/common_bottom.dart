import 'package:flutter/material.dart';
import '../../utils/color.dart';
import '../../utils/images.dart';
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
            items: [
              BottomNavigationBarItem(
                activeIcon: Image.asset(
                  Images.buyWhite,
                  height: 20,
                  width: 20,
                ),
                icon: Image.asset(
                  Images.buy,
                  height: 20,
                  width: 20,
                ),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                activeIcon: Image.asset(
                  Images.categoryWhite,
                  height: 20,
                  width: 20,
                ),
                icon: Image.asset(
                  Images.category,
                  height: 20,
                  width: 20,
                ),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                activeIcon: Image.asset(
                  Images.homeWhite,
                  height: 20,
                  width: 20,
                ),
                icon: Image.asset(
                  Images.home,
                  height: 20,
                  width: 20,
                ),
                label: 'Home',
              ),
              // Add items for your new tabs
              BottomNavigationBarItem(
                activeIcon: Image.asset(
                  Images.dashboardVendorWhite,
                  height: 20,
                  width: 20,
                ),
                icon: Image.asset(
                  Images.dashboardVendor,
                  height: 20,
                  width: 20,
                ),
                label: 'Vendor',
              ),
              BottomNavigationBarItem(
                activeIcon: Image.asset(
                  Images.dashboardProfileWhite,
                  height: 20,
                  width: 20,
                ),
                icon: Image.asset(
                  Images.dashboardProfile,
                  height: 20,
                  width: 20,
                ),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
