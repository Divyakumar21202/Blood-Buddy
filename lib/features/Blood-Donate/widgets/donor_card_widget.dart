import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_odisha_blood/common/customSnackbar.dart';
import 'package:smart_odisha_blood/features/Blood-Request/controller/blood_request_controller.dart';
import 'package:smart_odisha_blood/features/auth/controller/auth_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class DonorCardWidget extends ConsumerWidget {
  bool isRequested = false;
  final Map<String, dynamic> singleDonor;
  DonorCardWidget({
    Key? key,
    required this.singleDonor,
    required this.isRequested,
  }) : super(key: key);
  void sendRequest(WidgetRef ref, BuildContext context, String mobileNumber,
      String blood) async {
    var model = await ref.read(authRepositoryControllerProvider).getUserModel(
          context: context,
          mobileNumber: mobileNumber,
        );
    if (model != null) {
      String receiverUid = model['uid'];

      ref.read(bloodRequestControllerProvider).sendRequest(
            receiverUid,
            blood,
            mobileNumber,
          );
    }
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
                        '${singleDonor['DonorName']}',
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
                        'Contact Number :  ',
                      ),
                      Text(
                        '${singleDonor['mobileNumber']}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
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
                        'City/Village :  ',
                      ),
                      Text(
                        '${singleDonor['City']}',
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
                        '${singleDonor['District']}',
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
                      TextButton(
                        onPressed: () {
                          ref
                              .read(authRepositoryControllerProvider)
                              .getUserModel(
                                context: context,
                                mobileNumber: singleDonor['mobileNumber'],
                              )
                              .then((value) {
                            if (value != null) {
                              String uid = value['uid'];
                              ref
                                  .watch(bloodRequestControllerProvider)
                                  .sendRequest(
                                    uid,
                                    singleDonor['BloodGroup'],
                                    singleDonor['mobileNumber'],
                                  );
                            } else {
                              CustomSnackBar(
                                content: 'No model Found',
                                context: context,
                              ).displaySnackBar();
                            }
                          });
                        },
                        child: const Text(
                          'Want to\nnotify Donor >',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          final Uri url = Uri(
                            scheme: 'sms',
                            path: '${singleDonor['mobileNumber']}',
                          );

                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          }
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
              color: Color.fromARGB(255, 255, 43, 28),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  singleDonor['BloodGroup'],
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
