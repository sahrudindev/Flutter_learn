import 'package:flutter/material.dart';
import 'package:pertemuan12/pages/notes/add_note_page.dart';
import 'package:pertemuan12/pages/notes/detail_note_page.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Center(
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'NOTES',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                " Silahkan Tulis Note kalian",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            style: const ButtonStyle(
              iconSize: MaterialStatePropertyAll(28.0),
              padding: MaterialStatePropertyAll(
                EdgeInsets.only(
                  top: 8,
                  right: 16,
                  bottom: 8,
                  left: 8,
                ),
              ),
            ),
            onPressed: () {
              // todo: exit push to login
            },
            icon: const Icon(Icons.exit_to_app_outlined),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return const AddNotePage();
            }),
          );
        },
        child: const Icon(Icons.note_add),
      ),
      body: ListView.builder(
        itemCount: 12,
        itemBuilder: (context, index) {
          return NoteCard(noteId: index.toString());
        },
      ),
    );
  }
}

class NoteCard extends StatelessWidget {
  final String noteId;
  const NoteCard({super.key, required this.noteId});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(noteId), // Key harus unik
      confirmDismiss: (direction) => _confirmDismiss(context),
      onDismissed: (direction) async {
        // todo: hapus note dari database, http.delete()
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              spreadRadius: 2,
              color: Colors.black12,
            ),
          ],
        ),
        child: ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return DetailNotePage();
                },
              ),
            );
          },
          title: const Text(
            'Judul note',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            ['flutter', 'android', 'ios'].map((tag) => "#$tag").join(' '),
            overflow: TextOverflow.ellipsis,
          ),
          trailing: IconButton(
            onPressed: () {
              // todo: edit note
            },
            icon: const Icon(Icons.edit_note),
          ),
        ),
      ),
    );
  }

  Future<bool?> _confirmDismiss(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirm'),
          content: const Text('Apakah kamu yakin ingin menghapus?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Hapus'),
            ),
          ],
        );
      },
    );
  }
}
