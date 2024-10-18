import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/features/auth/presentation/screens/profile.dart';
import 'package:weather_app/features/home/presentation/screens/home_screen.dart';

class PageLayout extends StatefulWidget {
  const PageLayout({super.key});

  @override
  State<PageLayout> createState() => _PageLayoutState();
}

class _PageLayoutState extends State<PageLayout> {
  int _currentIndex = 1;
  List<Widget> screens = [const ProfileScreen(), HomeScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF0B043F),
      body: Stack(
        children: [
          screens[_currentIndex],
          Positioned(
            bottom: 20, // Adjust to position the floating bar where you want
            left: 10,
            right: 10,
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5), // Add shadow for floating effect
                    ),
                  ],
                ),
                child: BottomNavigationBar(
                  currentIndex: _currentIndex,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  selectedItemColor: Color(0xFF5C8CE6),
                  unselectedItemColor: Colors.white,
                  selectedIconTheme: IconThemeData(
                      size: 25.sp
                  ),
                  unselectedIconTheme: IconThemeData(
                      size: 22.sp
                  ),
                  onTap: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: 'Profile',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                  ],
                  type: BottomNavigationBarType.fixed,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
