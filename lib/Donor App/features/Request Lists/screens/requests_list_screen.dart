import 'package:flutter/material.dart';
import 'package:smart_odisha_blood/Donor%20App/features/Request%20Lists/widgets/request_widget.dart';

class RequestListScreen extends StatelessWidget {
  const RequestListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
            itemCount: 12,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(top: 12, left: 6, right: 6),
                child: const RequestWidget(),
              );
            }),
      ),
    );
  }
}
