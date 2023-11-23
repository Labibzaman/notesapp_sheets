import 'package:flutter/material.dart';
import 'package:notesapp_sheets/gsheet_api/gsheets_api.dart';

import 'myBox.dart';

class GridvieofBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: GsheetApi.currentNotes.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
      ),
      itemBuilder: (BuildContext context, int index) {
        return MyBox(text: GsheetApi.currentNotes[index]);
      },
    );
  }
}
