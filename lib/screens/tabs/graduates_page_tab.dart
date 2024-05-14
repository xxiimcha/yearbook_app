import 'package:flutter/material.dart';
import 'package:yearbook_app/screens/tabs/alumnus_tab.dart';
import 'package:yearbook_app/screens/tabs/batch_tab.dart';
import 'package:yearbook_app/screens/tabs/courses_tab.dart';
import 'package:yearbook_app/widgets/text_widget.dart';

class GraduatesTab extends StatefulWidget {
  const GraduatesTab({super.key});

  @override
  State<GraduatesTab> createState() => _GraduatesTabState();
}

class _GraduatesTabState extends State<GraduatesTab> {
  List<String> selectedStatus = [
    'College of Arts and Sciences',
    'College of Engineering and Technology',
    'Yu An Log College of Business and Accountancy',
  ];

  List cet = [
    'Computer Engineering',
    'Electrical Engineering',
    'Electronics Engineering',
    'Materials Engineering',
    'Computer Science',
    'Information Technology',
    'Entertainment and Multimedia Computing'
  ];

  List cas = [
    'Communication',
    'Interdisciplinary Studies',
    'Political Science',
    'Psychology',
    'Biology'
  ];

  List yu = [
    'Accountancy',
    ' Accounting Information System',
    'Management Accounting',
    'Agribusiness',
    'Entrepreneurship',
    'Hospitality Management',
    'Tourism Management',
    ' Business Administration',
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
                      builder: (context) => CoursesTab(
                            title: selectedStatus[index],
                            list: index == 0
                                ? cas
                                : index == 1
                                    ? cet
                                    : yu,
                          )));
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
