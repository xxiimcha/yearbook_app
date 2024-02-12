import 'package:flutter/material.dart';
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
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 100,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextWidget(
                              text: 'Name here...',
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: 'Bold',
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextWidget(
                              text: 'Batch ${widget.batch}',
                              fontSize: 14,
                              fontFamily: 'Bold',
                            ),
                            TextWidget(
                              text: 'Course here...',
                              fontSize: 14,
                              fontFamily: 'Bold',
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextWidget(
                              text: 'Sky is the limit!',
                              fontSize: 12,
                              fontFamily: 'Regular',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }
}
