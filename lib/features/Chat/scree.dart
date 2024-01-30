import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        Align(
          alignment: Alignment.centerRight,
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width - 45),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                elevation: 1,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: 6,
                        right: 6,
                        left: 6,
                        bottom: 2,
                      ),
                      padding: const EdgeInsets.only(
                        left: 6,
                        right: 6,
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hy there , I want blood packets , Urgent !!',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width - 45),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                elevation: 1,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: 6,
                        right: 6,
                        left: 6,
                        bottom: 2,
                      ),
                      padding: const EdgeInsets.only(
                        left: 6,
                        right: 6,
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hey , I\'m happy to donate ..',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  //       Stack(
                  //         children: [

                  //           const Positioned(
                  //             right: 10,
                  //             bottom: 4,
                  //             child: Row(
                  //               children: [
                  //                 Text('9:23 AM'),
                  //                 SizedBox(
                  //                   width: 5,
                  //                 ),
                  //                  Icon(
                  //                         Icons.done_all,
                  //                         color: Colors.blue,
                  //                         size: 20,
                  //                       )

                  //               ],
                  //             ),
                  //           ),

                  //       ),],

                  //   ),
                  // ),
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width - 45),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                elevation: 1,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: 6,
                        right: 6,
                        left: 6,
                        bottom: 2,
                      ),
                      padding: const EdgeInsets.only(
                        left: 6,
                        right: 6,
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'oohhhh 😮 Urgent , Im happy to donate , Lets I will inform you.',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  //       Stack(
                  //         children: [

                  //           const Positioned(
                  //             right: 10,
                  //             bottom: 4,
                  //             child: Row(
                  //               children: [
                  //                 Text('9:23 AM'),
                  //                 SizedBox(
                  //                   width: 5,
                  //                 ),
                  //                  Icon(
                  //                         Icons.done_all,
                  //                         color: Colors.blue,
                  //                         size: 20,
                  //                       )

                  //               ],
                  //             ),
                  //           ),

                  //       ),],

                  //   ),
                  // ),
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width - 45),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                elevation: 1,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: 6,
                        right: 6,
                        left: 6,
                        bottom: 2,
                      ),
                      padding: const EdgeInsets.only(
                        left: 6,
                        right: 6,
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'No Problem , we meet at hospital ',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  //       Stack(
                  //         children: [

                  //           const Positioned(
                  //             right: 10,
                  //             bottom: 4,
                  //             child: Row(
                  //               children: [
                  //                 Text('9:23 AM'),
                  //                 SizedBox(
                  //                   width: 5,
                  //                 ),
                  //                  Icon(
                  //                         Icons.done_all,
                  //                         color: Colors.blue,
                  //                         size: 20,
                  //                       )

                  //               ],
                  //             ),
                  //           ),

                  //       ),],

                  //   ),
                  // ),
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width - 45),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                elevation: 1,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: 6,
                        right: 6,
                        left: 6,
                        bottom: 2,
                      ),
                      padding: const EdgeInsets.only(
                        left: 6,
                        right: 6,
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Thank U very much For your Support',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  //       Stack(
                  //         children: [

                  //           const Positioned(
                  //             right: 10,
                  //             bottom: 4,
                  //             child: Row(
                  //               children: [
                  //                 Text('9:23 AM'),
                  //                 SizedBox(
                  //                   width: 5,
                  //                 ),
                  //                  Icon(
                  //                         Icons.done_all,
                  //                         color: Colors.blue,
                  //                         size: 20,
                  //                       )

                  //               ],
                  //             ),
                  //           ),

                  //       ),],

                  //   ),
                  // ),
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width - 45),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                elevation: 1,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: 6,
                        right: 6,
                        left: 6,
                        bottom: 2,
                      ),
                      padding: const EdgeInsets.only(
                        left: 6,
                        right: 6,
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'I Glad to give Blood ',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  //       Stack(
                  //         children: [

                  //           const Positioned(
                  //             right: 10,
                  //             bottom: 4,
                  //             child: Row(
                  //               children: [
                  //                 Text('9:23 AM'),
                  //                 SizedBox(
                  //                   width: 5,
                  //                 ),
                  //                  Icon(
                  //                         Icons.done_all,
                  //                         color: Colors.blue,
                  //                         size: 20,
                  //                       )

                  //               ],
                  //             ),
                  //           ),

                  //       ),],

                  //   ),
                  // ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 240,
        ),
        SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.80,
                      child: Column(
                        children: [
                          TextField(
                            onChanged: (val) {},
                            decoration: InputDecoration(
                              filled: true,
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              hintStyle: const TextStyle(color: Colors.black),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: SizedBox(
                                  width: 58,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: const Icon(
                                          Icons.attach_file_rounded,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: const Icon(Icons.camera_alt),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              hintText: "Message",
                            ),
                          ),
                        ],
                      ),
                    ),
                    FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: Colors.green[400],
                      shape: const CircleBorder(
                        side: BorderSide.none,
                      ),
                      child: const Icon(Icons.send),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ]),
    ));
  }
}
