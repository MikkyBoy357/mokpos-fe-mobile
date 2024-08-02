import 'package:flutter/material.dart';
import 'package:mokpos/app/model/customer_model.dart';
import 'package:mokpos/app/view/cashier_screens/add_customer_screen.dart';
import 'package:mokpos/base/constant.dart';
import 'package:mokpos/widgets/back_button_black.dart';

import '../../../widgets/my_drawer.dart';

class CustomerListScreen extends StatefulWidget {
  const CustomerListScreen({super.key});

  @override
  State<CustomerListScreen> createState() => _CustomerListScreenState();
}

class _CustomerListScreenState extends State<CustomerListScreen> {
  bool isGrid = false;

  void changeGrid() {
    isGrid = !isGrid;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mes clients"),
      ),
      drawer: const MyDrawer(),
      body: Column(
          children: [
          const Divider(thickness: 0.5),
      Container(
        height: 45,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            width: 0.8,
            color: Colors.grey,
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Search name, phone number, or email",
              style: TextStyle(
                // fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
            Row(
              children: [SizedBox(width: 10), Icon(Icons.search)],
            ),
          ],
        ),
      ),
      const Divider(thickness: 0.5),
      Container(
        color: Colors.grey[100],
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
                children: [
                const SizedBox(height: 20),


            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              separatorBuilder: (context, index) =>
                  const SizedBox(height: 10),
              itemBuilder: (context, index) {
                List <CustomerModel> customers = [
                  CustomerModel(name: "MED",
                    email: "med@gmsil.com",
                    id: "22",
                    walletBalance: 23,),
                ];
                var currentCustomer =
                customers[index];

                return InkWell(

                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Text(currentCustomer.name!),
                          const Icon(Icons.chevron_right)
                        ],
                      ),
                      const Divider(thickness: 0.5),
                    ],
                  ),
                );
              },
            ),


            //
            const SizedBox(height: 20),
        ],
      ),
    ),
    ),
    ],
    ),
    floatingActionButtonLocation:
    FloatingActionButtonLocation.centerFloat,
    floatingActionButton: MyTextButton(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    label: "Ajoutr un client",
    backgroundColor: Colors.green,
    onTap: () {
    Constant.navigatePush(context, const AddCustomerScreen());
    },
    )
    ,
    );

  }
}
