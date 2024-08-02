import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryModalSheet extends StatelessWidget {
  const HistoryModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: const BoxDecoration(
        // color: Colors.amber,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Reset",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop(context);
                },
                child: const Icon(CupertinoIcons.xmark),
              )
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Last 90 days",
                style: TextStyle(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop(context);
                },
                child: const CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.green,
                  child: CircleAvatar(
                    radius: 13,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 11,
                      backgroundColor: Colors.green,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Choose date",
                style: TextStyle(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop(context);
                },
                child: const CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.green,
                  child: CircleAvatar(
                    radius: 13,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 11,
                      backgroundColor: Colors.green,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Starting from",
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  Container(
                    height: 50,
                    // width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    decoration: BoxDecoration(
                      color: const Color(0xFF000000).withOpacity(0.05),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "21 June 2020",
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          CupertinoIcons.chevron_down,
                          color: Colors.white,
                          size: 15,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "To",
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  Container(
                    height: 50,
                    // width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    decoration: BoxDecoration(
                      color: const Color(0xFF000000).withOpacity(0.05),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "21 June 2020",
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          CupertinoIcons.chevron_down,
                          color: Colors.white,
                          size: 15,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 10),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: const BoxDecoration(
              color: Colors.green,
            ),
            child: const Center(
              child: Text(
                "Filter",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
