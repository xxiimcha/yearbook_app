import 'package:flutter/material.dart';
import 'package:yearbook_app/widgets/text_widget.dart';

class SchoolActivitiesTab extends StatefulWidget {
  const SchoolActivitiesTab({super.key});

  @override
  State<SchoolActivitiesTab> createState() => _SchoolActivitiesTabState();
}

class _SchoolActivitiesTabState extends State<SchoolActivitiesTab> {
  String type = 'Overview';

  String pres = '''
Br. Joaquin S. Martinez FSC, D.Min.
2017-Present
 
Br. Manuel Pajarillo FSC
2015-2017
Br. Raymund Suplido FSC
2007-2015
Br. Gus Boquer FSC
1998-2007
Br. Roly Dizon FSC
1986-1998
Br. Vic Franco FSC
1983-1986
Br. Rafael Donato FSC
1976-1983
Br. Daniel Ortiz FSC
1970-1974
Br. Dominic Fournier FSC
1957-1959 | 1968-1970
Br. Gratian Mc Nicholas FSC
1965-1968
Br. Fancis Cody FSC
1953-1957 | 1959-1965 | 1974-1976
Br. Dennis Ruhland FSC
April - December 1952

''';
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: 150,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            'assets/images/Rectangle 4.png',
                          ),
                          fit: BoxFit.fitWidth),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextWidget(
                    text: 'USLS College Alumni Homecoming 2023!',
                    fontSize: 16,
                    fontFamily: 'Bold',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: 150,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            'assets/images/Rectangle 1.png',
                          ),
                          fit: BoxFit.fitWidth),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextWidget(
                    text:
                        'Welcome, Lasallians! As we embark on the second semester of AY 2023-2024 ',
                    fontSize: 16,
                    fontFamily: 'Bold',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
