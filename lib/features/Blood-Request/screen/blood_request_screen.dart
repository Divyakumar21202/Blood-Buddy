import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_odisha_blood/features/Blood-Request/controller/blood_request_controller.dart';
import 'package:smart_odisha_blood/features/Blood-Request/widgets/blood_request_card_widget.dart';

class BloodRequestScreen extends ConsumerWidget {
  const BloodRequestScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder(
        stream: ref.watch(bloodRequestControllerProvider).getDonorRequestList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Text(
                'Loading...',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            );
          }
          var mpp = snapshot.data;
          return ListView.builder(
            itemCount: mpp!.length,
            itemBuilder: ((context, index) {
              // String name = mpp[index]['name'];
              String bloodGroup = mpp[index]['RBT'];
              return RequestCard(
                name: 'name',
                mobileNumber: 'mobileNumber',
                bloodGroup: bloodGroup,
              );
            }),
          );
        },
      ),
    );
  }
}
