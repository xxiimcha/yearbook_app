import 'package:flutter/material.dart';
import 'package:yearbook_app/screens/tabs/alumnus_profile_tab.dart';
import 'package:yearbook_app/utlis/colors.dart';
import 'package:yearbook_app/widgets/button_widget.dart';
import 'package:yearbook_app/widgets/text_widget.dart';
import 'package:yearbook_app/widgets/textfield_widget.dart';

class AlumnusTab extends StatefulWidget {
  String batch;
  String college;
  String courses;

  AlumnusTab(
      {super.key,
      required this.batch,
      required this.college,
      required this.courses});

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
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          createAccountDialog();
        },
      ),
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

  final name = TextEditingController();
  final course = TextEditingController();
  final section = TextEditingController();
  final moto = TextEditingController();

  createAccountDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: SizedBox(
            width: 350,
            height: 500,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[500],
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                          child: TextWidget(
                            text: 'Upload Picture',
                            fontSize: 14,
                            fontFamily: 'Bold',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(
                      color: Colors.black,
                      controller: name,
                      label: 'Name',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(
                      color: Colors.black,
                      controller: section,
                      label: 'Section',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(
                      color: Colors.black,
                      controller: course,
                      label: 'Course',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(
                      color: Colors.black,
                      controller: moto,
                      label: 'Moto',
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: ButtonWidget(
                          color: primary,
                          label: 'Add',
                          onPressed: (() async {
                            Navigator.pop(context);
                          })),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
