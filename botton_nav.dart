import 'package:flutter/material.dart';
import 'package:flutter_project/artisan_user/artsan_profile_screen.dart';
import 'package:flutter_project/artisan_user/booking_screen.dart';
import 'package:flutter_project/artisan_user/home_screen.dart';
import 'package:flutter_project/artisan_user/portfolio_management_screen.dart';
import 'package:flutter_project/artisan_user/setting_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  List screens = [
    {"screen": const ArtisanHomeScreen()},
    {"screen": const ArtisanProfile()},
    {"screen": const PortfolioManagementScreen()},
    {"screen": const BookingScreen()},
    {"screen": const SettingsScreen()}
  ];

  int _selectedIndex = 0;

  onPageSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex]["screen"],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder),
            label: 'Portfolio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pink,
        unselectedItemColor:
            Colors.black, // <-- set the unselected item color here
        onTap: onPageSelected,
      ),
    );
  }
}
