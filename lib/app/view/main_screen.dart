
import 'package:flutter/material.dart';
import 'package:mokpos/app/view/cashier_screens/customer_list_screen.dart';
import 'package:mokpos/app/view/owner_screens/dashboard_screen.dart';
import 'package:mokpos/app/view/products_screen.dart';

import '../../widgets/bottom_bar.dart';
import 'owner_screens/employee_list_screen.dart';

// ignore: must_be_immutable
class MainScreen extends StatefulWidget {
  var cartItemId;

  MainScreen({super.key});
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedItem = 0;
  late String uid;
  final PageController _pageController = PageController(initialPage: 0);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            _selectedItem = index;
            print(_selectedItem);
          });
        },
        controller: _pageController,
        children: const [
          DashboardScreen(),
          EmployeeListScreen(),
          CustomerListScreen(),
          ProductsScreen(),
        ],
      ),
      bottomNavigationBar: BottomBar(
        currentIndex: _selectedItem,
        onTap: (index) {
          setState(
            () {
              _selectedItem = index;
              _pageController.animateToPage(_selectedItem,
                  duration: const Duration(milliseconds: 200), curve: Curves.linear);
            },
          );
        },
      ),
    );
  }
}
