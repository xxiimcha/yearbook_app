import 'package:flutter/material.dart';
import 'package:yearbook_app/widgets/text_widget.dart';
import 'add_alumnus.dart'; // Import the new screen

class AlumnusProfileTab extends StatefulWidget {
  const AlumnusProfileTab({super.key});

  @override
  State<AlumnusProfileTab> createState() => _AlumnusProfileTabState();
}

class _AlumnusProfileTabState extends State<AlumnusProfileTab> {
  List<String> selectedStatus = [
    '2021 - 2022',
    '2022 - 2023',
    '2023 - 2024',
  ];

  String selectedChip = '2021 - 2022';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget(
              text: 'Stella Marie Ryan',
              fontSize: 24,
              fontFamily: 'Bold',
            ),
            const SizedBox(
              height: 10,
            ),
            Image.asset(
              'assets/images/pic.png',
              height: 200,
            ),
            const SizedBox(
              height: 20,
            ),
            TextWidget(
              text: 'BSIT- 4A',
              fontSize: 14,
              fontFamily: 'Medium',
            ),
            const SizedBox(
              height: 5,
            ),
            TextWidget(
              text: '"Sky is the limit"',
              fontSize: 14,
              fontFamily: 'Bold',
            ),
            const SizedBox(
              height: 20,
            ),
            TextWidget(
              text: 'Achievements:',
              fontSize: 22,
              fontFamily: 'Medium',
            ),
            const SizedBox(
              height: 10,
            ),
            TextWidget(
              align: TextAlign.start,
              text: '''
Dean’s Lister 2022
Dean’s Lister 1st Semester 2023 
Dean’s Lister 2nd Semester 2024
''',
              fontSize: 16,
              fontFamily: 'Medium',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the new screen when the button is pressed
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NewAlumnus()),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
