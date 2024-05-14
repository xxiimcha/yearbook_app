import 'package:flutter/material.dart';
import 'package:yearbook_app/screens/tabs/alumnus_tab.dart';
import 'package:yearbook_app/screens/tabs/batch_tab.dart';
import 'package:yearbook_app/widgets/text_widget.dart';

class CoursesTab extends StatefulWidget {
  List list;
  String title;

  CoursesTab({
    super.key,
    required this.list,
    required this.title,
  });

  @override
  State<CoursesTab> createState() => _CoursesTabState();
}

class _CoursesTabState extends State<CoursesTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 1,
        title: TextWidget(
          text: 'Courses',
          fontSize: 18,
          fontFamily: 'Bold',
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          TextWidget(
            text: widget.title,
            fontSize: 24,
            fontFamily: 'Bold',
          ),
          SizedBox(
              height: 500,
              child: ListView.builder(
                itemCount: widget.list.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const BatchTab()));
                      },
                      child: TextWidget(
                        text: widget.list[index],
                        fontSize: 18,
                        fontFamily: 'Bold',
                      ),
                    ),
                  );
                },
              )),
        ],
      ),
    );
  }
}
