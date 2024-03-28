// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RequestWidget extends StatelessWidget {
  final String address;
  final String campNumber;
  final String bloodCampName;
  const RequestWidget({
    Key? key,
    required this.address,
    required this.campNumber,
    required this.bloodCampName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 250,
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
                        bloodCampName,
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
                        campNumber,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Address:',
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 100,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            address,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () async {},
                        child: const Text(
                          'Donate',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                      const SizedBox(width: 40)
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 40,
            top: 80,
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 100,
              ),
              child: Column(
                children: [
                  IconButton(
                    onPressed: () async {
                      // String url = 'tel:${campNumber}';
                      // if (await canLaunchUrl(Uri.parse(url))) {
                      //   await launchUrl(Uri.parse(url));
                      // } else {
                      //   CustomSnackBar(
                      //           content: 'Something get Error',
                      //           context: context)
                      //       .displaySnackBar();
                      // }
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text(
                              'Confirm Call',
                              style: TextStyle(fontWeight: FontWeight.w400),
                            ),
                            content: Text('Do you want to call $campNumber ?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () async {
                                  Navigator.of(context).pop();
                                  String url = 'tel:$campNumber';
                                  if (await canLaunchUrl(Uri.parse(url))) {
                                    await launchUrl(Uri.parse(url));
                                  } else {}
                                },
                                child: const Text('Call'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.call,
                      color: Colors.red,
                    ),
                  ),
                  // InkWell(
                  //   splashColor: Colors.green,
                  //   borderRadius: BorderRadius.circular(50),
                  //   onTap: () {},
                  //   child: ConstrainedBox(
                  //     constraints:
                  //         const BoxConstraints(maxHeight: 40, maxWidth: 40),
                  //     child: const Card(
                  //       child: Image(
                  //           image: AssetImage('asset/images/whatsapp.png')),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          // Positioned(
          //   right: 47,
          //   top: 130,
          //   child:
          // ),
          // const Positioned(
          //   child: Card(
          //     elevation: 1,
          //     surfaceTintColor: Colors.red,
          //     color: Color.fromARGB(255, 255, 43, 28),
          //     child: Padding(
          //       padding: EdgeInsets.all(8),
          //       child: Text(
          //         "A+ve",
          //         style: TextStyle(
          //           fontSize: 13,
          //           fontWeight: FontWeight.w500,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
