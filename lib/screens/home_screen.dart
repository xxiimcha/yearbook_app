import 'package:flutter/material.dart';
import 'package:yearbook_app/screens/auth/login_page.dart';
import 'package:yearbook_app/screens/tabs/about_school_tab.dart';
import 'package:yearbook_app/screens/tabs/about_theme_tab.dart';
import 'package:yearbook_app/screens/tabs/graduates_page_tab.dart';
import 'package:yearbook_app/screens/tabs/school_activities_tab.dart';
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
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 125,
                ),
                TextWidget(
                  text: 'HOME',
                  fontSize: 18,
                  fontFamily: 'Bold',
                ),
                const SizedBox(),
                IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: const Text(
                                'Logout Confirmation',
                                style: TextStyle(
                                    fontFamily: 'QBold',
                                    fontWeight: FontWeight.bold),
                              ),
                              content: const Text(
                                'Are you sure you want to Logout?',
                                style: TextStyle(fontFamily: 'QRegular'),
                              ),
                              actions: <Widget>[
                                MaterialButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(true),
                                  child: const Text(
                                    'Close',
                                    style: TextStyle(
                                        fontFamily: 'QRegular',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                MaterialButton(
                                  onPressed: () async {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginPage()));
                                  },
                                  child: const Text(
                                    'Continue',
                                    style: TextStyle(
                                        fontFamily: 'QRegular',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ));
                  },
                  icon: const Icon(
                    Icons.logout,
                  ),
                ),
              ],
            ),
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
                  : selectedChip == 'School Activities'
                      ? const SchoolActivitiesTab()
                      : const AboutThemeTab()
        ],
      ),
    );
  }
}
