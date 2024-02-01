import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RequestCard extends StatelessWidget {
  final String name;
  final String mobileNumber;
  final String bloodGroup;
  const RequestCard({
    Key? key,
    required this.name,
    required this.mobileNumber,
    required this.bloodGroup,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          color: Colors.cyan,
          elevation: 2,
          margin: const EdgeInsets.symmetric(horizontal: 12),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 180,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        'Name : $name',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'Contact : $mobileNumber',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 20,
          top: -10,
          child: Card(
            color: Colors.red[300],
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                bloodGroup,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        // Positioned(
        //   right: 60,
        //   bottom: 45,
        //   child: IconButton(
        //     color: Colors.red,
        //     onPressed: () {},
        //     icon: const Icon(
        //       Icons.call,
        //     ),
        //   ),
        // ),
        Positioned(
          right: 20,
          bottom: 45,
          child: IconButton(
            color: Colors.red,
            onPressed: () async {
              final Uri uri = Uri(
                scheme: 'tel',
                path: mobileNumber.toString(),
              );
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri);
              }
            },
            icon: const Icon(
              Icons.call,
            ),
          ),
        ),
      ],
    );
  }
}
