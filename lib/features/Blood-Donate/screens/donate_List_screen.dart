import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_odisha_blood/common/custom_loader.dart';
import 'package:smart_odisha_blood/features/Blood-Donate/controller/blood_donate_controller.dart';
import 'package:smart_odisha_blood/features/Blood-Donate/widgets/donor_card_widget.dart';
import 'package:smart_odisha_blood/models/user_model.dart';

class donateListScreenX extends ConsumerStatefulWidget {
  final String bloodGroup;
  const donateListScreenX({
    super.key,
    required this.bloodGroup,
  });

  @override
  ConsumerState<donateListScreenX> createState() => _DonateListScreenXState();
}

class _DonateListScreenXState extends ConsumerState<donateListScreenX> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  String bloodGroup = 'A+ve';

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(children: [
        Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: TextField(
                onChanged: (val) {
                  setState(() {});
                },
                controller: _searchController,
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
                  hintText: 'Search by Category',
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
                      return customLoader();
                    }
                    List<UserModel> list = snapshot.data!;
                    List<UserModel> newList = [];

                    for (var data in list) {
                      if (data.bloodGroup.toLowerCase() ==
                          widget.bloodGroup.toLowerCase()) {
                        newList.add(data);
                      }
                    }
                    list = newList;
                    List<UserModel> filterList1 = [];
                    List<UserModel> filterList3 = [];
                    List<UserModel> filterList4 = [];

                    if (_searchController.text.isNotEmpty) {
                      filterList1 = list.where((element) {
                        return element.name.toString().toLowerCase().contains(
                              _searchController.text.toString().toLowerCase(),
                            );
                      }).toList();

                      filterList3 = list.where((element) {
                        return element.city.toString().toLowerCase().contains(
                              _searchController.text.toString().toLowerCase(),
                            );
                      }).toList();
                      filterList4 = list.where((element) {
                        return element.district
                            .toString()
                            .toLowerCase()
                            .contains(
                              _searchController.text.toString().toLowerCase(),
                            );
                      }).toList();
                    }

                    var finalList = filterList1 + filterList3 + filterList4;
                    if (finalList.isNotEmpty) {
                      list = finalList;
                    }
                    return ListView.builder(
                      controller: scrollController,
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
        ),
      ]),
    );
  }
}
