
import 'package:flutter/material.dart';

import '../../base/constant.dart';
import '../../widgets/back_button_black.dart';

class NfcScanScreenTopup extends StatelessWidget {
  const NfcScanScreenTopup({super.key});



  @override
  Widget build(BuildContext context) {

        return Scaffold(
          // backgroundColor: Colors.green,
          appBar: AppBar(
            title: const Text("Topup"),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Spacer(),
                Container(
                  // height: 250,
                  child: Builder(builder: (context) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              const Text("ID:"),
                              const SizedBox(width: 10),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 110,
                                child: const Text(
                                  "11",
                                  softWrap: true,
                                ),
                              ),
                              // Text("${customerViewModel.customerData!.id}"),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Text("Name:"),
                              const SizedBox(width: 10),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 120,
                                child: const Text(
                                  "Med",
                                  softWrap: true,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          // Row(
                          //   children: [
                          //     Text("email:"),
                          //     MyTextButton(
                          //       backgroundColor: Color(0xFF2A3256),
                          //       label:
                          //           "${customerViewModel.customerData!.email}",
                          //     ),
                          //   ],
                          // ),
                        ],
                      );
                  }),
                ),
                const SizedBox(height: 20),
                Center(
                  child: InkWell(
                    child: CircleAvatar(
                      radius: 100,
                      backgroundColor: Colors.black.withOpacity(0.05),
                      child: CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.black.withOpacity(0.47),
                        child: const CircleAvatar(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          radius: 60,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.wifi_tethering_sharp,
                                size: 50,
                              ),
                              Text(
                                "NFC",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  "Recharger",
                  style: TextStyle(
                    // color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "CFA 4000",
                  style: TextStyle(
                    // color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  "Press and get an NFC closer to your device",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    // color: Colors.white,
                    // fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                // MyTextButton(
                //   onTap: () async {
                //     await customerViewModel.makePayment(
                //       context,
                //       amount: shopViewModel.totalPrice,
                //     );
                //   },
                //   margin: EdgeInsets.symmetric(horizontal: 20),
                //   label: "Simulate Card Scan",
                // )
                // Spacer(),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Builder(builder: (context) {

              return MyTextButton(
                onTap: () {
                  Constant.backToPrev(context);
                },
                margin: const EdgeInsets.symmetric(horizontal: 20),
                label: "BACK",
              );

          }),
        );

  }
}
