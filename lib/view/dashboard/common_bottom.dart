import 'package:alpha_ecommerce_18oct/viewModel/homeViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/color.dart';
import '../../utils/images.dart';
import '../cart/cart.dart';
import '../category/category.dart';
import '../home/home.dart';
import '../profile/profile.dart';
import '../vendor/vendor.dart';

class BottomNavPage extends StatefulWidget {
  final int index;
  const BottomNavPage({Key? key, required this.index}) : super(key: key);

  @override
  _BottomNavPageState createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  late HomeViewModel homeProvider;

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
    homeProvider = Provider.of<HomeViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    homeProvider = Provider.of<HomeViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      body: _pages[_currentIndex],
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 0),
        height:
            homeProvider.isScrolled ? kBottomNavigationBarHeight * 1.5 : 0.0,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Images.bgTab),
              fit: BoxFit.cover,
            ),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Theme.of(context).brightness == Brightness.dark
                  ? Colors.transparent
                  : Colors.white,
            ),
            child: BottomNavigationBar(
              elevation: 10,
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              selectedLabelStyle: const TextStyle(fontSize: 12),
              selectedItemColor: Theme.of(context).brightness == Brightness.dark
                  ? colors.textColor
                  : colors.buttonColor,
              unselectedItemColor: Colors.grey,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                  activeIcon: Image.asset(
                    Images.buyWhite,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? null
                        : Colors.teal,
                    height: homeProvider.isScrolled ? 25 : 0,
                    width: homeProvider.isScrolled ? 25 : 0,
                  ),
                  icon: Image.asset(
                    Images.buy,
                    height: homeProvider.isScrolled ? 25 : 0,
                    width: homeProvider.isScrolled ? 25 : 0,
                  ),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  activeIcon: Image.asset(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? null
                        : Colors.teal,
                    Images.categoryWhite,
                    height: homeProvider.isScrolled ? 25 : 0,
                    width: homeProvider.isScrolled ? 25 : 0,
                  ),
                  icon: Image.asset(
                    Images.category,
                    height: homeProvider.isScrolled ? 25 : 0,
                    width: homeProvider.isScrolled ? 25 : 0,
                  ),
                  label: 'Categories',
                ),
                BottomNavigationBarItem(
                  activeIcon: Image.asset(
                    Images.homeWhite,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? null
                        : Colors.teal,
                    height: homeProvider.isScrolled ? 25 : 0,
                    width: homeProvider.isScrolled ? 25 : 0,
                  ),
                  icon: Image.asset(
                    Images.home,
                    height: homeProvider.isScrolled ? 25 : 0,
                    width: homeProvider.isScrolled ? 25 : 0,
                  ),
                  label: 'Home',
                ),
                // Add items for your new tabs
                BottomNavigationBarItem(
                  activeIcon: Image.asset(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? null
                        : Colors.teal,
                    Images.dashboardVendorWhite,
                    height: homeProvider.isScrolled ? 25 : 0,
                    width: homeProvider.isScrolled ? 25 : 0,
                  ),
                  icon: Image.asset(
                    Images.dashboardVendor,
                    height: homeProvider.isScrolled ? 25 : 0,
                    width: homeProvider.isScrolled ? 25 : 0,
                  ),
                  label: 'Vendor',
                ),
                BottomNavigationBarItem(
                  activeIcon: Image.asset(
                    Images.dashboardProfileWhite,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? null
                        : Colors.teal,
                    height: homeProvider.isScrolled ? 25 : 0,
                    width: homeProvider.isScrolled ? 25 : 0,
                  ),
                  icon: Image.asset(
                    Images.dashboardProfile,
                    height: homeProvider.isScrolled ? 25 : 0,
                    width: homeProvider.isScrolled ? 25 : 0,
                  ),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
