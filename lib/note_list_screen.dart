import 'package:flutter/material.dart';
import 'task.dart';

class NoteListScreen extends StatefulWidget {
  final Task task;

  const NoteListScreen({required this.task});

  @override
  _NoteListScreenState createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  TextEditingController _noteController = TextEditingController();
  late List<TextEditingController> _noteControllers;

  @override
  void initState() {
    super.initState();
    _noteControllers = List.generate(
      widget.task.notes.length,
      (index) => TextEditingController(text: widget.task.notes[index]),
    );
  }

  @override
  void dispose() {
    _noteController.dispose();
    _noteControllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.task.title),
        backgroundColor: Colors.blue[100], // Set background color similar to TaskManagementApp
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.task.notes.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0), // Add padding to separate each note section
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1), // Set the background color with 10% opacity
                      borderRadius: BorderRadius.circular(10), // Set border radius for rounded corners
                    ),
                    child: ListTile(
                      title: TextField(
                        controller: _noteControllers[index],
                        decoration: const InputDecoration(
                          hintText: 'Enter note',
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          setState(() {
                            widget.task.removeNoteAt(index);
                            _noteControllers.removeAt(index).dispose();
                          });
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1), 
                borderRadius: BorderRadius.circular(10), 
              ),
              padding: const EdgeInsets.all(8), 
              child: TextField(
                controller: _noteController,
                decoration: const InputDecoration(
                  hintText: 'Enter new note',
                  border: InputBorder.none, 
                ),
                onSubmitted: (value) {
                  setState(() {
                    widget.task.addNote(value);
                    _noteControllers.add(TextEditingController(text: value));
                    _noteController.clear();
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
