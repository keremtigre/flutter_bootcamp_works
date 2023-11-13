library home_page.dart;

import 'package:flutter/material.dart';
import 'package:odev3/Data/data.dart';
import 'package:odev3/Models/note_model.dart';
import 'package:odev3/Extansions/context_extansions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
part 'parts/bottom_widgets.dart';
part 'parts/categories_text_button_list.dart';
part 'parts/notes_list.dart';
part 'parts/page_title.dart';
part 'parts/top_icons.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});


  final notes = Data.notes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TopIcons(),
          const PageTitle(),
          const categoriesButtonList(),
          NotesList(notes: notes),
          const BottomWidgets()
        ],
      ),
    );
  }
}
