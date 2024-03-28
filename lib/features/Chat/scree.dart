import 'package:flutter/material.dart';
import 'package:generative_ai_dart/generative_ai_dart.dart';
import 'package:smart_odisha_blood/features/Chat/widgets/message_card.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  @override
  State<ChatScreen> createState() => _BotChatScreenState();
}

class _BotChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  List<MyMessageCard> message_card_list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: message_card_list.length,
                          itemBuilder: (context, index) {
                            return MyMessageCard(
                              message: message_card_list[index].message,
                              time: message_card_list[index].time,
                              userName: message_card_list[index].userName,
                              isMe: message_card_list[index].isMe,
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: () async {
                    message_card_list.add(
                      MyMessageCard(
                        message: _controller.text.toString(),
                        time: DateTime.now().minute.toString(),
                        userName: "You",
                        isMe: true,
                      ),
                    );
                    setState(() {});
                    _controller.text = '';
                    const apiKey = "AIzaSyBx26XywJ8L7h-r_Y6LKx1cVHCSVmwo2p4";
                    final model = GenerativeModel(
                        apiKey: apiKey,
                        params: ModelParams(model: 'gemini-pro'));
                    List<Content> content;
                    content = [
                      Content.user([Part.text(_controller.text)])
                    ];
                    final response = await model.generateContent(content);

                    message_card_list.add(MyMessageCard(
                        message: response.text(),
                        time: DateTime.now().minute.toString(),
                        userName: 'bot',
                        isMe: false));

                    setState(() {});
                  },
                  child: const Icon(
                    Icons.send,
                    color: Colors.redAccent,
                    size: 33,
                  ),
                ),
                hintText: 'Want a Suggestion?',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class ChatScreen extends StatefulWidget {
//   const ChatScreen({super.key});

//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   final TextEditingController _controller = TextEditingController();

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(child: Container(

//           )),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 6.0),
//             child: TextField(
//               onChanged: (val) {
//                 setState(() {});
//               },
//               controller: _controller,
//               keyboardType: TextInputType.text,
//               decoration: InputDecoration(
//                 suffixIcon: GestureDetector(
//                   onTap: () {},
//                   child: _controller.text.isNotEmpty
//                       ? Icon(
//                           Icons.send,
//                           color: Colors.red.shade400,
//                         )
//                       : Icon(
//                           Icons.message,
//                           color: Colors.red.shade400,
//                         ),
//                 ),
//                 hintText: 'Ask Anything Related to Blood',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 3),
//         ],
//       ),
//     );
//   }
// }

// class MessageCard extends StatelessWidget {
//   final bool isMe;
//   const MessageCard({super.key, required this.isMe});

//   @override
//   Widget build(BuildContext context) {
//     return ConstrainedBox(
//       constraints: BoxConstraints(
//         maxWidth: MediaQuery.of(context).size.width - 75,
//       ),
//       child: Container(
//         decoration: BoxDecoration(
//           color: isMe ? Colors.red.shade300 : Colors.blue.shade300,
//         ),
//         child: Text('data'),
//       ),
//     );
//   }
// }




// /*
// SingleChildScrollView(
//       child: Column(children: [
//         // Align(
//         //   alignment: Alignment.centerRight,
//         //   child: ConstrainedBox(
//         //     constraints:
//         //         BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width - 45),
//         //     child: Padding(
//         //       padding: const EdgeInsets.all(6),
//         //       child: Card(
//         //         shape: RoundedRectangleBorder(
//         //             borderRadius: BorderRadius.circular(6)),
//         //         margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
//         //         elevation: 1,
//         //         child: Column(
//         //           children: [
//         //             Container(
//         //               margin: const EdgeInsets.only(
//         //                 top: 6,
//         //                 right: 6,
//         //                 left: 6,
//         //                 bottom: 2,
//         //               ),
//         //               padding: const EdgeInsets.only(
//         //                 left: 6,
//         //                 right: 6,
//         //               ),
//         //               child: const Column(
//         //                 crossAxisAlignment: CrossAxisAlignment.start,
//         //                 children: [
//         //                   Text(
//         //                     'Hy there , I want blood packets , Urgent !!',
//         //                     textAlign: TextAlign.left,
//         //                     style: TextStyle(
//         //                       fontWeight: FontWeight.bold,
//         //                       fontSize: 16,
//         //                     ),
//         //                   ),
//         //                 ],
//         //               ),
//         //             ),
//         //           ],
//         //         ),
//         //       ),
//         //     ),
//         //   ),
//         // ),
//         // Align(
//         //   alignment: Alignment.centerLeft,
//         //   child: ConstrainedBox(
//         //     constraints:
//         //         BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width - 45),
//         //     child: Padding(
//         //       padding: const EdgeInsets.all(6),
//         //       child: Card(
//         //         shape: RoundedRectangleBorder(
//         //             borderRadius: BorderRadius.circular(6)),
//         //         margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
//         //         elevation: 1,
//         //         child: Column(
//         //           children: [
//         //             Container(
//         //               margin: const EdgeInsets.only(
//         //                 top: 6,
//         //                 right: 6,
//         //                 left: 6,
//         //                 bottom: 2,
//         //               ),
//         //               padding: const EdgeInsets.only(
//         //                 left: 6,
//         //                 right: 6,
//         //               ),
//         //               child: const Column(
//         //                 crossAxisAlignment: CrossAxisAlignment.start,
//         //                 children: [
//         //                   Text(
//         //                     'Hey , I\'m happy to donate ..',
//         //                     textAlign: TextAlign.left,
//         //                     style: TextStyle(
//         //                       fontWeight: FontWeight.bold,
//         //                       fontSize: 16,
//         //                     ),
//         //                   ),
//         //                 ],
//         //               ),
//         //             ),
//         //           ],
//         //           //       Stack(
//         //           //         children: [

//         //           //           const Positioned(
//         //           //             right: 10,
//         //           //             bottom: 4,
//         //           //             child: Row(
//         //           //               children: [
//         //           //                 Text('9:23 AM'),
//         //           //                 SizedBox(
//         //           //                   width: 5,
//         //           //                 ),
//         //           //                  Icon(
//         //           //                         Icons.done_all,
//         //           //                         color: Colors.blue,
//         //           //                         size: 20,
//         //           //                       )

//         //           //               ],
//         //           //             ),
//         //           //           ),

//         //           //       ),],

//         //           //   ),
//         //           // ),
//         //         ),
//         //       ),
//         //     ),
//         //   ),
//         // ),
//         // Align(
//         //   alignment: Alignment.centerLeft,
//         //   child: ConstrainedBox(
//         //     constraints:
//         //         BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width - 45),
//         //     child: Padding(
//         //       padding: const EdgeInsets.all(6),
//         //       child: Card(
//         //         shape: RoundedRectangleBorder(
//         //             borderRadius: BorderRadius.circular(6)),
//         //         margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
//         //         elevation: 1,
//         //         child: Column(
//         //           children: [
//         //             Container(
//         //               margin: const EdgeInsets.only(
//         //                 top: 6,
//         //                 right: 6,
//         //                 left: 6,
//         //                 bottom: 2,
//         //               ),
//         //               padding: const EdgeInsets.only(
//         //                 left: 6,
//         //                 right: 6,
//         //               ),
//         //               child: const Column(
//         //                 crossAxisAlignment: CrossAxisAlignment.start,
//         //                 children: [
//         //                   Text(
//         //                     'oohhhh 😮 Urgent , Im happy to donate , Lets I will inform you.',
//         //                     textAlign: TextAlign.left,
//         //                     style: TextStyle(
//         //                       fontWeight: FontWeight.bold,
//         //                       fontSize: 16,
//         //                     ),
//         //                   ),
//         //                 ],
//         //               ),
//         //             ),
//         //           ],
//         //           //       Stack(
//         //           //         children: [

//         //           //           const Positioned(
//         //           //             right: 10,
//         //           //             bottom: 4,
//         //           //             child: Row(
//         //           //               children: [
//         //           //                 Text('9:23 AM'),
//         //           //                 SizedBox(
//         //           //                   width: 5,
//         //           //                 ),
//         //           //                  Icon(
//         //           //                         Icons.done_all,
//         //           //                         color: Colors.blue,
//         //           //                         size: 20,
//         //           //                       )

//         //           //               ],
//         //           //             ),
//         //           //           ),

//         //           //       ),],

//         //           //   ),
//         //           // ),
//         //         ),
//         //       ),
//         //     ),
//         //   ),
//         // ),
//         // Align(
//         //   alignment: Alignment.centerLeft,
//         //   child: ConstrainedBox(
//         //     constraints:
//         //         BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width - 45),
//         //     child: Padding(
//         //       padding: const EdgeInsets.all(6),
//         //       child: Card(
//         //         shape: RoundedRectangleBorder(
//         //             borderRadius: BorderRadius.circular(6)),
//         //         margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
//         //         elevation: 1,
//         //         child: Column(
//         //           children: [
//         //             Container(
//         //               margin: const EdgeInsets.only(
//         //                 top: 6,
//         //                 right: 6,
//         //                 left: 6,
//         //                 bottom: 2,
//         //               ),
//         //               padding: const EdgeInsets.only(
//         //                 left: 6,
//         //                 right: 6,
//         //               ),
//         //               child: const Column(
//         //                 crossAxisAlignment: CrossAxisAlignment.start,
//         //                 children: [
//         //                   Text(
//         //                     'No Problem , we meet at hospital ',
//         //                     textAlign: TextAlign.left,
//         //                     style: TextStyle(
//         //                       fontWeight: FontWeight.bold,
//         //                       fontSize: 16,
//         //                     ),
//         //                   ),
//         //                 ],
//         //               ),
//         //             ),
//         //           ],
//         //           //       Stack(
//         //           //         children: [

//         //           //           const Positioned(
//         //           //             right: 10,
//         //           //             bottom: 4,
//         //           //             child: Row(
//         //           //               children: [
//         //           //                 Text('9:23 AM'),
//         //           //                 SizedBox(
//         //           //                   width: 5,
//         //           //                 ),
//         //           //                  Icon(
//         //           //                         Icons.done_all,
//         //           //                         color: Colors.blue,
//         //           //                         size: 20,
//         //           //                       )

//         //           //               ],
//         //           //             ),
//         //           //           ),

//         //           //       ),],

//         //           //   ),
//         //           // ),
//         //         ),
//         //       ),
//         //     ),
//         //   ),
//         // ),
//         // Align(
//         //   alignment: Alignment.centerRight,
//         //   child: ConstrainedBox(
//         //     constraints:
//         //         BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width - 45),
//         //     child: Padding(
//         //       padding: const EdgeInsets.all(6),
//         //       child: Card(
//         //         shape: RoundedRectangleBorder(
//         //             borderRadius: BorderRadius.circular(6)),
//         //         margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
//         //         elevation: 1,
//         //         child: Column(
//         //           children: [
//         //             Container(
//         //               margin: const EdgeInsets.only(
//         //                 top: 6,
//         //                 right: 6,
//         //                 left: 6,
//         //                 bottom: 2,
//         //               ),
//         //               padding: const EdgeInsets.only(
//         //                 left: 6,
//         //                 right: 6,
//         //               ),
//         //               child: const Column(
//         //                 crossAxisAlignment: CrossAxisAlignment.start,
//         //                 children: [
//         //                   Text(
//         //                     'Thank U very much For your Support',
//         //                     textAlign: TextAlign.left,
//         //                     style: TextStyle(
//         //                       fontWeight: FontWeight.bold,
//         //                       fontSize: 16,
//         //                     ),
//         //                   ),
//         //                 ],
//         //               ),
//         //             ),
//         //           ],
//         //           //       Stack(
//         //           //         children: [

//         //           //           const Positioned(
//         //           //             right: 10,
//         //           //             bottom: 4,
//         //           //             child: Row(
//         //           //               children: [
//         //           //                 Text('9:23 AM'),
//         //           //                 SizedBox(
//         //           //                   width: 5,
//         //           //                 ),
//         //           //                  Icon(
//         //           //                         Icons.done_all,
//         //           //                         color: Colors.blue,
//         //           //                         size: 20,
//         //           //                       )

//         //           //               ],
//         //           //             ),
//         //           //           ),

//         //           //       ),],

//         //           //   ),
//         //           // ),
//         //         ),
//         //       ),
//         //     ),
//         //   ),
//         // ),
//         // Align(
//         //   alignment: Alignment.centerLeft,
//         //   child: ConstrainedBox(
//         //     constraints:
//         //         BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width - 45),
//         //     child: Padding(
//         //       padding: const EdgeInsets.all(6),
//         //       child: Card(
//         //         shape: RoundedRectangleBorder(
//         //             borderRadius: BorderRadius.circular(6)),
//         //         margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
//         //         elevation: 1,
//         //         child: Column(
//         //           children: [
//         //             Container(
//         //               margin: const EdgeInsets.only(
//         //                 top: 6,
//         //                 right: 6,
//         //                 left: 6,
//         //                 bottom: 2,
//         //               ),
//         //               padding: const EdgeInsets.only(
//         //                 left: 6,
//         //                 right: 6,
//         //               ),
//         //               child: const Column(
//         //                 crossAxisAlignment: CrossAxisAlignment.start,
//         //                 children: [
//         //                   Text(
//         //                     'I Glad to give Blood ',
//         //                     textAlign: TextAlign.left,
//         //                     style: TextStyle(
//         //                       fontWeight: FontWeight.bold,
//         //                       fontSize: 16,
//         //                     ),
//         //                   ),
//         //                 ],
//         //               ),
//         //             ),
//         //           ],
//         //           //       Stack(
//         //           //         children: [

//         //           //           const Positioned(
//         //           //             right: 10,
//         //           //             bottom: 4,
//         //           //             child: Row(
//         //           //               children: [
//         //           //                 Text('9:23 AM'),
//         //           //                 SizedBox(
//         //           //                   width: 5,
//         //           //                 ),
//         //           //                  Icon(
//         //           //                         Icons.done_all,
//         //           //                         color: Colors.blue,
//         //           //                         size: 20,
//         //           //                       )

//         //           //               ],
//         //           //             ),
//         //           //           ),

//         //           //       ),],

//         //           //   ),
//         //           // ),
//         //         ),
//         //       ),
//         //     ),
//         //   ),
//         // ),
//         // SizedBox(
//         //   height: 240,
//         // ),
//         SizedBox(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 8),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width * 0.80,
//                       child: Column(
//                         children: [
//                           TextField(
//                             onChanged: (val) {},
//                             decoration: InputDecoration(
//                               filled: true,
//                               border: const OutlineInputBorder(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(12)),
//                                 borderSide: BorderSide(
//                                   width: 0,
//                                   style: BorderStyle.none,
//                                 ),
//                               ),
//                               hintStyle: const TextStyle(color: Colors.black),
//                               suffixIcon: Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 20.0),
//                                 child: SizedBox(
//                                   width: 58,
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.end,
//                                     children: [
//                                       InkWell(
//                                         onTap: () {},
//                                         child: const Icon(
//                                           Icons.attach_file_rounded,
//                                         ),
//                                       ),
//                                       const SizedBox(
//                                         width: 8,
//                                       ),
//                                       InkWell(
//                                         onTap: () {},
//                                         child: const Icon(Icons.camera_alt),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               hintText: "Message",
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     FloatingActionButton(
//                       onPressed: () {},
//                       backgroundColor: Colors.green[400],
//                       shape: const CircleBorder(
//                         side: BorderSide.none,
//                       ),
//                       child: const Icon(Icons.send),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         )
//       ]),
//     ));
//   */