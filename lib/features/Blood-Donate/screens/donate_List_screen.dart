import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_odisha_blood/common/custom_loader.dart';
import 'package:smart_odisha_blood/features/Blood-Donate/controller/blood_donate_controller.dart';
import 'package:smart_odisha_blood/features/Blood-Donate/screens/filter_screen_search.dart';
import 'package:smart_odisha_blood/features/Blood-Donate/widgets/donor_card_widget.dart';
import 'package:smart_odisha_blood/models/donor_model.dart';
import 'package:smart_odisha_blood/models/selected_filter_data.dart';

class DonateListScreenX extends ConsumerStatefulWidget {
  const DonateListScreenX({super.key});

  @override
  ConsumerState<DonateListScreenX> createState() => _DonateListScreenXState();
}

class _DonateListScreenXState extends ConsumerState<DonateListScreenX> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  SelectFilterData? filterData;
  void applyFilter() {
    filterData = ref.read(SelectFilterDataProvider);
    isFilter = !isFilter;

    setState(() {
      ref.read(SelectFilterDataProvider.notifier).update(
            (state) => SelectFilterData(
              aPpositive: {'A+ve': false},
              bPositive: {'B+ve': false},
              abPositive: {'AB+ve': false},
              oPositive: {'O+ve': false},
              aNegative: {'A-ve': false},
              bNegative: {'A-ve': false},
              abNegative: {'AB-ve': false},
              oNegative: {'O-ve': false},
              country: '',
              state: '',
              city: '',
            ),
          );
    });
  }

  bool isFilter = false;

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
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
                suffixIcon: InkWell(
                  splashColor: Colors.red[300],
                  radius: 9,
                  borderRadius: BorderRadius.circular(
                    9,
                  ),
                  onTap: () {
                    setState(() {
                      isFilter = !isFilter;
                    });
                  },
                  child: Icon(
                    Icons.filter_list,
                    color: isFilter ? Colors.red : null,
                  ),
                ),
                hintText: 'Search Donor Name Here',
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
                  List<DonorModel> filterList1 = [];
                  List<DonorModel> filterList2 = [];
                  List<DonorModel> filterList = [];
                  if (_searchController.text.isNotEmpty) {
                    filterList1 = list.where((element) {
                      return element.DonorName.toString()
                          .toLowerCase()
                          .contains(
                            _searchController.text.toString().toLowerCase(),
                          );
                    }).toList();
                  }
                  if (filterData != null) {
                    filterList = list.where((element) {
                      return element.City.toString().toLowerCase().contains(
                            filterData!.city.toLowerCase(),
                          );
                    }).toList();
                    filterList2 = list.where((element) {
                      return element.District.toString().toLowerCase().contains(
                            filterData!.state.toLowerCase(),
                          );
                    }).toList();
                    // if (filterData!.aPpositive['A+ve']!) {
                    //   filterList = filterList +
                    //       list.where((element) {
                    //         return element.BloodGroup.toString()
                    //             .toLowerCase()
                    //             .contains(
                    //               'A+ve'.toLowerCase(),
                    //             );
                    //       }).toList();
                    // }
                    // if (filterData!.bPositive['B+ve']!) {
                    //   filterList = filterList +
                    //       list.where((element) {
                    //         return element.BloodGroup.toString()
                    //             .toLowerCase()
                    //             .contains(
                    //               'B+ve'.toLowerCase(),
                    //             );
                    //       }).toList();
                    // }
                  }
                  var finalList = filterList1 + filterList2;
                  if (finalList.isNotEmpty) {
                    list = finalList;
                  }
                  return ListView.builder(
                    controller: scrollController,
                    itemCount: list.length,
                    physics: !isFilter
                        ? const AlwaysScrollableScrollPhysics()
                        : const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var singleDonor = list[index].toMap();
                      return DonorCardWidget(
                        singleDonor: singleDonor,
                        isRequested: true,
                      );
                    },
                  );
                }),
          ),
        ],
      ),
      isFilter
          ? ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                child: FilterScreenSearch(
                  onApply: () {
                    applyFilter();
                  },
                  onClose: () {
                    setState(() {
                      isFilter = !isFilter;
                    });
                  },
                ),
              ),
            )
          : const SizedBox(),
    ]);
  }
}
