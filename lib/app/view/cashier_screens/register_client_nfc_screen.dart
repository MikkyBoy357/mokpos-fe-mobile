// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mokpos/base/constant.dart';
import 'package:nfc_manager/nfc_manager.dart';

import '../../../nfc_model/write_record.dart';
import '../../../repository/repository.dart';
import '../../../widgets/back_button_black.dart';

class NdefWriteModel with ChangeNotifier {
  NdefWriteModel(this._repo);

  final Repository _repo;

  Stream<Iterable<WriteRecord>> subscribe() {
    return _repo.subscribeWriteRecordList();
  }

  Future<void> delete(WriteRecord record) {
    return _repo.deleteWriteRecord(record);
  }

  Future<String?> handleTag(
    NfcTag tag,
    Iterable<WriteRecord> recordList,
    BuildContext context, {
    required Future<void> Function(BuildContext context, NfcTag tag,
            {required String actionType})
        beforeFunction,
    required Future<void> Function(BuildContext context) afterFunction,
  }) async {
    final tech = Ndef.from(tag);

    print("===WriteMyTAG===> ${tag.data}");
    await beforeFunction(context, tag, actionType: "register");

    if (tech == null) throw ('Tag is not ndef.');

    if (!tech.isWritable) throw ('Tag is not ndef writable.');

    try {
      final message = NdefMessage(recordList.map((e) => e.record).toList());
      await tech.write(message);

      // Add New Customer data to Cloud Firestore
      afterFunction(context);
    } on PlatformException catch (e) {
      throw (e.message ?? 'Some error has occurred.');
    }

    return '[Ndef - Write] is completed.';
  }
}

class RegisterClientNfcScreen extends StatelessWidget {
  const RegisterClientNfcScreen({super.key});



  @override
  Widget build(BuildContext context) {

        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Register client NFC Card",
              style: TextStyle(color: Colors.amber),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFCE1F).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor:
                                  const Color(0xFFFFCE1F).withOpacity(0.4),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "NFC",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "This feature will allow you communicate with an NFC device and show the details of an item. To test it out you need a NFC",
                          style: TextStyle(
                            color: Color(0xFFD8A900),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: GestureDetector(
                      onTap: () async {

                      },
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
                    "Register for:",
                    style: TextStyle(
                      // color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Med",
                    style: TextStyle(
                      // color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "email",
                    style: TextStyle(
                      // color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Press and get an NFC closer to your device",
                    style: TextStyle(
                      // color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  // Spacer(),
                  const SizedBox(height: 20)
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: MyTextButton(
              backgroundColor: Colors.red,
              onTap: () {
                // Constant.navigatePush(context, NfcScanScreen());
                Constant.backToPrev(context);
              },
              margin: const EdgeInsets.symmetric(horizontal: 20),
              label: "BACK",
            ),
          ),
        );

  }
}
