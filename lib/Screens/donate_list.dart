import 'package:flutter/material.dart';
import 'package:smart_odisha_blood/Constant-Widgets/Donate_List_item/donate_item_view.dart';

class DonateListScreen extends StatefulWidget {
  const DonateListScreen({super.key});
  @override
  State<DonateListScreen> createState() => _DonateListScreenState();
}
class _DonateListScreenState extends State<DonateListScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 50,
                itemBuilder: (_, i) {
                  return const DonateItemWidget();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
