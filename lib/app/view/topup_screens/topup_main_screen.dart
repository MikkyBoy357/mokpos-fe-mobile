
import 'package:flutter/material.dart';
import 'package:mokpos/app/view/topup_screens/topup_screen.dart';

import '../../../widgets/topup_bottom_bar.dart';
import '../cashier_screens/add_customer_screen.dart';

// ignore: must_be_immutable
class TopupMainScreen extends StatefulWidget {
  var cartItemId;

  TopupMainScreen({super.key});
  @override
  _TopupMainScreenState createState() => _TopupMainScreenState();
}

class _TopupMainScreenState extends State<TopupMainScreen> {
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
          TopupScreen(),
          AddCustomerScreen()
          // Text("Checking"),
          // CustomerListScreen(),
        ],
      ),
      bottomNavigationBar: TopupBottomBar(
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
