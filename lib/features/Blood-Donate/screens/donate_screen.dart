import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_odisha_blood/Constant/appbar_widget.dart';
import 'package:smart_odisha_blood/features/Blood-Donate/controller/blood_donate_controller.dart';
import 'package:smart_odisha_blood/features/Blood-Donate/screens/donate_edit_widget.dart';

class DonateScreen extends ConsumerStatefulWidget {
  const DonateScreen({super.key});

  @override
  ConsumerState<DonateScreen> createState() => _DonateScreenState();
}

class _DonateScreenState extends ConsumerState<DonateScreen> {
  bool isEdit = false;
  String name = '';
  String city = '';
  String district = '';
  String bloodGroup = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Colors.pink, Colors.red])),
        ),
        title: const Text('Your Profile'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => setState,
            icon: const Icon(
              Icons.refresh,
              color: Colors.black,
              size: 23,
            ),
          ),
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 600),
            child: StreamBuilder(
                stream: ref
                    .watch(bloodDonateRepositoryControllerProvider)
                    .getDonorDetail(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: Text(
                        'Loading ...',
                        style: TextStyle(color: Colors.red),
                      ),
                    );
                  }
                  String name = '';
                  String bloodType = '';
                  String city = '';
                  String district = '';
                  bool isAvailable = false;
                  if (snapshot.hasData) {
                    name = snapshot.data!.name.trim();
                    bloodType = snapshot.data!.bloodGroup;
                    city = snapshot.data!.city;
                    district = snapshot.data!.district;
                    isAvailable = snapshot.data!.isAvailable;
                  }
                  return name.isNotEmpty
                      ? DonorUserDataWidget(
                          isAvailable: isAvailable,
                          name: name,
                          city: city,
                          district: district,
                          bloodType: bloodType,
                        )
                      : Container(
                          height: 500,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 12,
                          ),
                          padding: const EdgeInsets.all(40),
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(
                              18,
                            ),
                          ),
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxHeight: 500),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Oops😕\nYou are Not Donate Yet !',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 34,
                                  ),
                                ),
                                const SizedBox(
                                  height: 28,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const DonateEditWidget(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Click Here to Donate',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                }),
          )
        ],
      )),
    );
  }
}
