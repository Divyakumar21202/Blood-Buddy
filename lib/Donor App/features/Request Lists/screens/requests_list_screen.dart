import 'package:flutter/material.dart';
import 'package:smart_odisha_blood/Donor%20App/features/Request%20Lists/widgets/request_widget.dart';

class RequestListScreen extends StatelessWidget {
  const RequestListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> bloodBanks = [
      {
        "District": "CUTTACK",
        "Hospital Name": "CRCBC CUTTACK",
        "Address": "Blood Bank Compound Medical Road, Manglabag Cuttack Odisha",
        "Contact No.": ["06712302258", "9437016151"],
        "Type": "district headquarter",
      },
      {
        "District": "KHURDA",
        "Hospital Name": "CAPITAL HOSPITAL",
        "Address": "Unit 6 Capital Hospital Bhubaneswar Odisha",
        "Contact No.": ["06742394985", "8280406475"],
        "Type": "district headquarter",
      },
      {
        "District": "BALASORE",
        "Hospital Name": "DHH BALASORE",
        "Address": "Odisha Red Cross Blood Bank D.H.H,Balasore pin: 756101",
        "Contact No.": ["06782241496", "9999999999"],
        "Type": "district headquarter",
      },
      {
        "District": "NAYAGARH",
        "Hospital Name": "DHH NAYAGARH",
        "Address": "Odisha Red Cross Blood Bank, Head Qtr Hospital, Nayagarh",
        "Contact No.": ["9437089215", "9898989898"],
        "Type": "district headquarter",
      },
      {
        "District": "KEONJHAR",
        "Hospital Name": "DHH KEONJHAR",
        "Address": "DISTRICT HEADQUARTER HOSPITAL, KEONJHAR",
        "Contact No.": ["06766-254380", "9898989898"],
        "Type": "district headquarter",
      },
      {
        "District": "BOLANGIR",
        "Hospital Name": "SDH PATNAGARH",
        "Address":
            "ORISSA RED CROSS BLOOD BANK, At/Po- Patnagarh, Dist Balangir-767025 ( Odisha )",
        "Contact No.": ["06658 222161", "9898989898"],
        "Type": "subdivision headquarter",
      },
      {
        "District": "MAYURBHANJ",
        "Hospital Name": "DHH BARIPADA",
        "Address":
            "Odisha Red Cross Blood Bank,Baripada Mayurbhanj.Pin:-757001",
        "Contact No.": ["06792-254641", "9898989898"],
        "Type": "district headquarter",
      },
    ];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: ListView.builder(
              itemCount: bloodBanks.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> val = bloodBanks[index];
                return Container(
                  margin: const EdgeInsets.only(top: 12, left: 6, right: 6),
                  child: RequestWidget(
                    campNumber: val['Contact No.'][0],
                    address: val['Address'],
                    bloodCampName: val['Hospital Name'],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
