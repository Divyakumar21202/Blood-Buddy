import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class LocationSearchingScreen extends StatefulWidget {
  const LocationSearchingScreen({super.key});

  @override
  State<LocationSearchingScreen> createState() =>
      _LocationSearchingScreenState();
}

class _LocationSearchingScreenState extends State<LocationSearchingScreen> {
  final TextEditingController _controller = TextEditingController();
  String _sessionToken = '12432354';
  List<dynamic> _placesList = [];
  Uuid uuid = Uuid();
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      onChange();
    });
  }

  void onChange() {
    if (_sessionToken == null) {
      setState(() {
        _sessionToken = uuid.v4();
      });
    }
    getSuggestion(_controller.text);
  }

  void getSuggestion(String input) async {
    String kPLACES_API_KEY = 'AIzaSyDdAF48P3qUd21gCVfQAisRbOnAYxyz2Os';
    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request = '$baseURL?input=$input&key=$kPLACES_API_KEY';

    var res = await http.get(Uri.parse(request));

    if (res.statusCode == 200) {
      setState(() {
        _placesList = jsonDecode(res.body)['predictions'];
        print(_placesList.toString());
      });
    } else {
      ScaffoldMessenger(
        child: SnackBar(
          content: Text(
            res.toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  hintText: 'Enter location to be search'),
              controller: _controller,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _placesList.length,
                itemBuilder: (context, index) {
                  var singlePlace = _placesList[index];
                  return ListTile(
                    title: Text(singlePlace['description']),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
