import 'package:flutter/material.dart';
import 'package:yearbook_app/screens/tabs/about_school_tab.dart';
import 'package:yearbook_app/screens/tabs/about_theme_tab.dart';
import 'package:yearbook_app/screens/tabs/graduates_page_tab.dart';
import 'package:yearbook_app/utlis/colors.dart';
import 'package:yearbook_app/widgets/text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> selectedStatus = [
    'About the School',
    'About the Theme',
    'School Faculty',
    'Clubs & Orgs',
    'Graduates Page',
    'School Activities',
    'Yearbook Staff',
  ];

  String selectedChip = 'About the School';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 1,
        leading: Image.asset('assets/images/logo.png'),
        title: TextWidget(
          text: 'HOME',
          fontSize: 18,
          fontFamily: 'Bold',
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: selectedStatus.map((String status) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedChip = status;
                      });
                    },
                    child: FilterChip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                        side: BorderSide(
                          color: selectedChip == status
                              ? primary
                              : Colors.transparent,
                          width: 2.0,
                        ),
                      ),
                      showCheckmark: false,
                      backgroundColor: const Color(0xFFC6C6C6),
                      disabledColor: Colors.grey,
                      selectedColor: primary,
                      label: Text(
                        status,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      selected: selectedChip == status,
                      onSelected: (bool selected) {
                        setState(() {
                          selectedChip = status;
                        });
                        // This can be an empty callback since we're handling onTap separately
                      },
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          selectedChip == 'About the School'
              ? const AboutSchoolTab()
              : selectedChip == 'Graduates Page'
                  ? const GraduatesTab()
                  : const AboutThemeTab()
        ],
      ),
    );
  }
}
