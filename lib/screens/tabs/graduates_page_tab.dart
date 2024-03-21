import 'package:flutter/material.dart';
import 'package:yearbook_app/screens/tabs/alumnus_tab.dart';
import 'package:yearbook_app/screens/tabs/batch_tab.dart';
import 'package:yearbook_app/widgets/text_widget.dart';

class GraduatesTab extends StatefulWidget {
  const GraduatesTab({super.key});

  @override
  State<GraduatesTab> createState() => _GraduatesTabState();
}

class _GraduatesTabState extends State<GraduatesTab> {
  List<String> selectedStatus = [
    'College of Education',
    'College of Law',
    'College of Nursing',
    'College of Medicine',
    'Yu An Log College of Business and Accountancy',
    'College of Arts and Sciences',
    'College of Engineering and Technology'
  ];

  String selectedChip = 'COLLEGE OF ARTS AND SCIENCES';
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 450,
        child: ListView.builder(
          itemCount: selectedStatus.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(25.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const BatchTab()));
                },
                child: TextWidget(
                  text: selectedStatus[index],
                  fontSize: 18,
                  fontFamily: 'Bold',
                ),
              ),
            );
          },
        ));
  }
}
