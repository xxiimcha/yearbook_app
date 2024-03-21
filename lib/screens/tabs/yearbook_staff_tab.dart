import 'package:flutter/material.dart';
import 'package:yearbook_app/screens/tabs/alumnus_profile_tab.dart';
import 'package:yearbook_app/widgets/text_widget.dart';

class YearbookStaffTab extends StatefulWidget {
  String batch;

  YearbookStaffTab({super.key, required this.batch});

  @override
  State<YearbookStaffTab> createState() => _YearbookStaffTabState();
}

class _YearbookStaffTabState extends State<YearbookStaffTab> {
  List<String> selectedStatus = [
    'Yearbook Adviser',
    'Layout Editor',
    'Designer',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 450,
        child: ListView.builder(
          itemCount: selectedStatus.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: double.infinity,
                height: 125,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/pic.png',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(
                            text: 'Stella Marie Ryan',
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: 'Medium',
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextWidget(
                            text: selectedStatus[index],
                            fontSize: 14,
                            fontFamily: 'Bold',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
