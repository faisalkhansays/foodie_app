import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodie/constants_color.dart';
import 'bottom_navigation_bar/donation_tab.dart';
import 'bottom_navigation_bar/home_tab.dart';
import 'bottom_navigation_bar/info_tab.dart';
import 'bottom_navigation_bar/resources_tab.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  // Method to switch between tabs based on selected index
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  final List<Widget> _pages = [
    const HomeTab(),
    const ResourcesTab(),
    const DonationTab(),
    const InfoTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primary,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/home.svg",
              color: _selectedIndex == 0 ? primary : Colors.black,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/resource.svg",
                color: _selectedIndex ==1?primary:Colors.black
            ),
            label: 'Resources',

          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/donate.svg",
            color: _selectedIndex==2?primary:Colors.black,
            ),
            label: 'Donate',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/info.svg",
            color: _selectedIndex==3?primary:Colors.black,
            ),
            label: 'Info',
          ),
        ],
      ),
    );
  }
}


