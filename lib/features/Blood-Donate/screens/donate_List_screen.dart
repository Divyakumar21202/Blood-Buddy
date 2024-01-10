import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_odisha_blood/common/custom_loader.dart';
import 'package:smart_odisha_blood/features/Blood-Donate/controller/blood_donate_controller.dart';
import 'package:smart_odisha_blood/features/Blood-Donate/widgets/donor_card_widget.dart';
import 'package:smart_odisha_blood/models/donor_model.dart';

class DonateListScreenX extends ConsumerWidget {
  const DonateListScreenX({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          child: TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
              prefixIcon: const Icon(
                Icons.search,
              ),
              suffixIcon: InkWell(
                splashColor: Colors.red[300],
                radius: 9,
                borderRadius: BorderRadius.circular(
                  9,
                ),
                onTap: () {},
                child: const Icon(
                  Icons.filter_list,
                ),
              ),
              hintText: 'Search Here',
              hintStyle: const TextStyle(
                fontSize: 17,
              ),
              filled: true,
              fillColor: Colors.white10,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  12,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: StreamBuilder(
              stream: ref
                  .watch(bloodDonateRepositoryControllerProvider)
                  .getDonorList(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Loader();
                }
                List<DonorModel> list = snapshot.data!;

                return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    var singleDonor = list[index].toMap();
                    return DonorCardWidget(
                      singleDonor: singleDonor,
                    );
                  },
                );
              }),
        ),
      ],
    );
  }
}
