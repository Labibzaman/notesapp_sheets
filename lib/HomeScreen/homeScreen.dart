import 'dart:async';

import 'package:flutter/material.dart';
import 'package:notesapp_sheets/widgets/gridView.dart';

import '../gsheet_api/gsheets_api.dart';
import '../widgets/myButton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => setState(() {}));
  }

  void _post() {
    GsheetApi.insert(_controller.text);
    _controller.clear();
    setState(() {});
  }

  void starLoading() async {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (GsheetApi.loadinng == false) {
        setState(() {});
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //start loading wehn
    if (GsheetApi.loadinng == true) {
      starLoading();
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[300],
        title: const Center(
            child: Text(
          'POST A NOTE',
          style: TextStyle(color: Colors.black54),
        )),
      ),
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          Expanded(
            child: GsheetApi.loadinng == true
                ? Center(child: CircularProgressIndicator())
                : GridvieofBox(),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Enter here',
                        suffixIcon: IconButton(
                          onPressed: () {
                            _controller.clear();
                          },
                          icon: const Icon(Icons.clear),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MyButton(
                        text: 'P O S T',
                        function: () {
                          _post();
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
