import 'package:flutter/material.dart';

class MyMessageCard extends StatelessWidget {
  final String message;
  final String time;
  final String userName;
  final bool isMe;
  const MyMessageCard({
    super.key,
    required this.message,
    required this.time,
    required this.userName,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      child: Align(
        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 75,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: isMe
                          ? [Colors.red.shade400, Colors.pink.shade400]
                          : [Colors.pink.shade400, Colors.red.shade400]),
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                ),
                padding: const EdgeInsets.only(
                    top: 8, bottom: 16, right: 12, left: 12),
                child: Text(message),
              ),
              Positioned(
                right: 15,
                bottom: 3,
                child: Text(
                  time,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
