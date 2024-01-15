import 'package:flutter/material.dart';

class DonateItemWidget extends StatelessWidget {
  const DonateItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 5,
        ),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.red[300],
          ),
          height: 142,
          width: double.infinity,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Donor Name : Atul Thakar",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Mobile Number : 1235715648",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Blood Group : B +ve",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "City : Bhubaneswar",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
