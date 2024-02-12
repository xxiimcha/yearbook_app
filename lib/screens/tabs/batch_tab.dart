import 'package:flutter/material.dart';
import 'package:yearbook_app/screens/tabs/alumnus_tab.dart';
import 'package:yearbook_app/widgets/text_widget.dart';

class BatchTab extends StatefulWidget {
  const BatchTab({super.key});

  @override
  State<BatchTab> createState() => _BatchTabState();
}

class _BatchTabState extends State<BatchTab> {
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
        title: TextWidget(
          text: 'BATCH',
          fontSize: 18,
          fontFamily: 'Bold',
        ),
        centerTitle: true,
      ),
      body: SizedBox(
          height: 500,
          child: ListView.builder(
            itemCount: selectedStatus.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(25.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AlumnusTab(
                              batch: selectedStatus[index],
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
          )),
    );
  }
}
