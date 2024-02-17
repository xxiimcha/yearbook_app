import 'package:flutter/material.dart';
import 'package:yearbook_app/screens/tabs/alumnus_profile_tab.dart';
import 'package:yearbook_app/widgets/text_widget.dart';

class AlumnusTab extends StatefulWidget {
  String batch;

  AlumnusTab({super.key, required this.batch});

  @override
  State<AlumnusTab> createState() => _AlumnusTabState();
}

class _AlumnusTabState extends State<AlumnusTab> {
  List<String> selectedStatus = [
    'COLLEGE OF ARTS AND SCIENCES',
    'COLLEGE OF ENGINEERING AND TECHNOLOGY',
    'COLLEGE OF NURSING',
    'YU AN LOG COLLEGE OF BUSINESS AND ACCOUNTANCY',
    'COLLEGE OF LAW',
  ];

  String selectedChip = 'COLLEGE OF ARTS AND SCIENCES';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 1,
        title: TextWidget(
          text: 'Batch ${widget.batch}',
          fontSize: 18,
          fontFamily: 'Bold',
        ),
        centerTitle: true,
      ),
      body: SizedBox(
          height: 750,
          child: ListView.builder(
            itemCount: selectedStatus.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AlumnusProfileTab()));
                  },
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
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }
}
