import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_odisha_blood/features/Blood-Donate/Repository/blood_donate_repository.dart';

class DonorCardWidget extends ConsumerWidget {
  final Map<String, dynamic> singleDonor;
  const DonorCardWidget({
    Key? key,
    required this.singleDonor,
  }) : super(key: key);
  void sendRequest(WidgetRef ref, BuildContext context, String number,
      String blood, String name) async {
    // var model = await ref.read(authRepositoryControllerProvider).getUserModel(
    //       context: context,
    //       mobileNumber: number,
    //     );
    // if (model != null) {
    //   String receiverUid = model['uid'];

    //   ref
    //       .read(bloodRequestControllerProvider)
    //       .sendRequest(receiverUid, blood, number, name);
    // }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Stack(
        alignment: const Alignment(-1, -1.1),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 11,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 55,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Patient Name :  ',
                      ),
                      Text(
                        '${singleDonor['name']}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  // const SizedBox(
                  //   height: 12,
                  // ),
                  // Row(
                  //   children: [
                  //     const Text(
                  //       'Contact Number :  ',
                  //     ),
                  //     // Text(
                  //     //   '${singleDonor['mobileNumber']}',
                  //     //   style: const TextStyle(
                  //     //     fontWeight: FontWeight.bold,
                  //     //   ),
                  //     // ),
                  //   ],
                  // ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      const Text(
                        'City/Village :  ',
                      ),
                      Text(
                        '${singleDonor['city']}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      const Text(
                        'District :  ',
                      ),
                      Text(
                        '${singleDonor['district']}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      singleDonor['isAvailable']
                          ? const Text(
                              'Available',
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            )
                          : const Text(
                              'Not Available',
                              style: TextStyle(
                                color: Colors.blueGrey,
                              ),
                            ),
                      // TextButton(
                      //   onPressed: () {
                      //     // ref
                      //     //     .watch(bloodRequestControllerProvider)
                      //     //     .storeUserRequests(
                      //     //       context: context,
                      //     //       uid: singleDonor['uid'],
                      //     //       blood: singleDonor['bloodGroup'],
                      //     //     );
                      //   },
                      //   child: const Text(
                      //     'Want to\nnotify Donor >',
                      //     style: TextStyle(
                      //       color: Colors.red,
                      //     ),
                      //   ),
                      // ),
                      TextButton(
                        onPressed: () async {
                          ref.read(BloodDonateRepositoryProvider).makeRequest(
                                mobileNumber: singleDonor['mobileNumber'],
                              );

                          // final Uri url = Uri(
                          //   scheme: 'sms',
                          //   path: '${singleDonor['mobileNumber']}',
                          // );

                          // if (await canLaunchUrl(url)) {
                          //   await launchUrl(url);
                          // }
                        },
                        child: const Text(
                          'Send Request',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            child: Card(
              elevation: 1,
              surfaceTintColor: Colors.red,
              color: const Color.fromARGB(255, 255, 43, 28),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  singleDonor['bloodGroup'],
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
