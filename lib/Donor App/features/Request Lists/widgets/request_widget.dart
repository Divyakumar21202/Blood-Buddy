import 'package:flutter/material.dart';

class RequestWidget extends StatelessWidget {
  const RequestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 240,
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
                  const Row(
                    children: [
                      Text(
                        'Patient Name :  ',
                      ),
                      Text(
                        'name',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Row(
                    children: [
                      Text(
                        'Contact Number :  ',
                      ),
                      Text(
                        'mobileNumber',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Row(
                    children: [
                      Text(
                        'City/Village :  ',
                      ),
                      Text(
                        'city',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Row(
                    children: [
                      Text(
                        'District :  ',
                      ),
                      Text(
                        'District',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
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
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.call),
            ),
          ),
          Positioned(
            right: 47,
            top: 130,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 40, maxWidth: 40),
              child: const Card(
                child: Image(image: AssetImage('asset/images/whatsapp.png')),
              ),
            ),
          ),
          const Positioned(
            child: Card(
              elevation: 1,
              surfaceTintColor: Colors.red,
              color: Color.fromARGB(255, 255, 43, 28),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "A+ve",
                  style: TextStyle(
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
