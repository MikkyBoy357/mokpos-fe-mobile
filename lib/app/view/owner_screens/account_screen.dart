import 'package:flutter/material.dart';


class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {

        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Account",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                    ),
                    SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "MyStoreName",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("0821452384425"),
                        Text("owner@gmail.com"),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                // ListView.builder(
                //   physics: NeverScrollableScrollPhysics(),
                //   shrinkWrap: true,
                //   itemCount: 5,
                //   itemBuilder: (context, index) {
                //     return Column(
                //       children: [
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             Text(
                //               "MyStoreName",
                //               style: TextStyle(
                //                 fontSize: 17,
                //                 fontWeight: FontWeight.w600,
                //               ),
                //             ),
                //             Icon(Icons.chevron_right),
                //           ],
                //         ),
                //         SizedBox(
                //           height: 5,
                //         ),
                //         Divider(thickness: 0.3),
                //       ],
                //     );
                //   },
                // ),
                const Text(
                  "MokPOS v1.0.0",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Spacer(),
                GestureDetector(
                  onTap: () {
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.red,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "Logout",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        );

  }
}
