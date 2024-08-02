import 'package:flutter/material.dart';
import 'package:mokpos/widgets/back_button_black.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Methode de paiement"),
      ),
      body:
           Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.grey[300]!,
                )),
                child: const Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total facture:"),
                        Text(
                          "CFA 200",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("E-Wallet"),
                          const SizedBox(height: 20),
                          Container(
                            height: 70,
                            width: 130,
                            color: const Color(0xFFA7F673),
                            child: const Center(
                              child: Text(
                                "Cashless",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),


      bottomNavigationBar: const Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: MyTextButton(
          // onTap: () {
          //   Constant.navigatePush(context, NfcScanScreen.withDependency());
          // },
          margin: EdgeInsets.symmetric(horizontal: 16),
          label: "PAYER",
        ),
      ),
    );
  }
}
