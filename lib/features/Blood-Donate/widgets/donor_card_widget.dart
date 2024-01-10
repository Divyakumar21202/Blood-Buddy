// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DonorCardWidget extends StatelessWidget {
  final Map<String, dynamic> singleDonor;
  const DonorCardWidget({
    Key? key,
    required this.singleDonor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  const Text(
                    'Contact  : 95876426428',
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
                      const Text(
                        'Available',
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Send Request'),
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
