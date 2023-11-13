part of home_page.dart;

class NotesList extends StatelessWidget {
  const NotesList({
    super.key,
    required this.notes,
  });

  final List<Note> notes;

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) => NoteCard(context, notes[index]),
    ));
  }
}

// ignore: non_constant_identifier_names
Container NoteCard(BuildContext context, Note note) {
  return Container(
    margin: EdgeInsets.symmetric(
        horizontal: context.width / 18, vertical: context.width / 50),
    width: context.width / 3,
    height: context.width / 4,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: note.color,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 2.0,
            spreadRadius: 0.0,
            offset: Offset(2.0, 2.0), // shadow direction: bottom right
          )
        ]),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                note.title,
                style: context.noteTitleStyle,
              ),
              SizedBox(
                height: context.height / 100,
              ),
              Text(
                note.date,
                style: context.noteDateStyle,
              )
            ],
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            note.time,
            style: context.noteTimeStyle,
          ),
        ),
      ],
    ),
  );
}
