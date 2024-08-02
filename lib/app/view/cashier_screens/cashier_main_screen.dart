
import 'package:flutter/material.dart';
import 'package:mokpos/app/view/cashier_screens/customer_list_screen.dart';
import 'package:mokpos/widgets/bottom_bar.dart';

import 'cashier_home_screen.dart';

// ignore: must_be_immutable
class CashierMainScreen extends StatefulWidget {
  var cartItemId;

  CashierMainScreen({super.key});
  @override
  _CashierMainScreenState createState() => _CashierMainScreenState();
}

class _CashierMainScreenState extends State<CashierMainScreen> {
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
          CashierHomeScreen(),
          // Text("Checking"),
          CustomerListScreen(),
        ],
      ),
      bottomNavigationBar: CashierBottomBar(
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
