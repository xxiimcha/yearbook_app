import 'package:flutter/material.dart';
import 'package:yearbook_app/widgets/text_widget.dart';

class AboutSchoolTab extends StatelessWidget {
  const AboutSchoolTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < 5; i++)
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 250,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextWidget(
                      text: 'Title here...',
                      fontSize: 18,
                      fontFamily: 'Bold',
                    ),
                    const Divider(),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
