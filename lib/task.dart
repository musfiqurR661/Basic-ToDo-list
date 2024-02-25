class Task {
  final String title;
  final List<String> notes;

  Task(this.title, {List<String>? notes}) : notes = notes ?? [];

  void addNote(String note) {
    notes.add(note);
  }

  void editNoteAt(int index, String note) {
    notes[index] = note;
  }

  void removeNoteAt(int index) {
    notes.removeAt(index);
  }
}
