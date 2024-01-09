import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_odisha_blood/Constant/donor_list.dart';
import 'package:smart_odisha_blood/common/custom_loader.dart';
import 'package:smart_odisha_blood/features/Blood-Donate/controller/blood_donate_controller.dart';
import 'package:smart_odisha_blood/models/donor_model.dart';

class DonateListScreenX extends ConsumerWidget {
  const DonateListScreenX({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Map<String, String>> DonorList = donorList;
    return StreamBuilder(
        stream:
            ref.watch(bloodDonateRepositoryControllerProvider).getDonorList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Loader();
          }
          List<DonorModel> list = snapshot.data!;

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              var singleDonor = list[index].toMap();
              return Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                alignment: Alignment.center,
                padding: const EdgeInsets.all(
                  9,
                ),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Colors.purple,
                    Colors.red,
                  ]),
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                  color: Colors.brown,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 25,
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
                          'Patient Name :  ',
                        ),
                        Text(
                          '${singleDonor['BloodGroup']}',
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
                          'Patient Name :  ',
                        ),
                        Text(
                          '${singleDonor['BloodGroup']}',
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
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              );
            },
          );
        });
  }
}
