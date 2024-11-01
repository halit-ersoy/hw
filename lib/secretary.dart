import 'package:flutter/material.dart';

class Secretary extends StatefulWidget {
  const Secretary({super.key});

  @override
  _SecretaryState createState() => _SecretaryState();
}

class _SecretaryState extends State<Secretary> {
  List<String> announcements = [];
  final TextEditingController _announcementController = TextEditingController();

  void _addAnnouncement() {
    if (_announcementController.text.isNotEmpty) {
      setState(() {
        announcements.add(_announcementController.text);
      });
      _announcementController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Duyuru/Haber Girişi'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Duyuru/Haber Giriniz:',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: _announcementController,
              decoration: InputDecoration(
                hintText: 'Yeni bir duyuru veya haber ekle...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addAnnouncement,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle: const TextStyle(fontSize: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                'Ekle',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: announcements.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(announcements[index]),
                    ),
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
