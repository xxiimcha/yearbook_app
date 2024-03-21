import 'package:flutter/material.dart';
import 'package:yearbook_app/utlis/colors.dart';
import 'package:yearbook_app/widgets/button_widget.dart';
import 'package:yearbook_app/widgets/text_widget.dart';

class AboutSchoolTab extends StatefulWidget {
  const AboutSchoolTab({super.key});

  @override
  State<AboutSchoolTab> createState() => _AboutSchoolTabState();
}

class _AboutSchoolTabState extends State<AboutSchoolTab> {
  String type = 'Overview';

  String pres = '''
Br. Joaquin S. Martinez FSC, D.Min. 2017-Present
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 150,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            'assets/images/school.png',
                          ),
                          fit: BoxFit.fitWidth),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ButtonWidget(
                        color: primary,
                        radius: 100,
                        width: 75,
                        height: 35,
                        fontSize: 14,
                        label: 'Overview',
                        onPressed: () {
                          setState(() {
                            type = 'Overview';
                          });
                        },
                      ),
                      ButtonWidget(
                        color: primary,
                        radius: 100,
                        width: 75,
                        height: 35,
                        fontSize: 14,
                        label: 'Mission, Vision,\nand Core Values',
                        onPressed: () {
                          setState(() {
                            type = 'Values';
                          });
                        },
                      ),
                      ButtonWidget(
                        color: primary,
                        radius: 100,
                        width: 75,
                        height: 35,
                        fontSize: 14,
                        label: 'University\nPresidents',
                        onPressed: () {
                          setState(() {
                            type = 'Presidents';
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: TextWidget(
                      text: type == 'Overview'
                          ? 'The University of St. La Salle, a non-stock and non-profit corporation, was established in 1952 by three American Brothers under the Philippine Province of the Brothers of the Christian Schools, an international institute of religious Brothers dedicated to the human and Christian education of the young, especially the poor.'
                          : type == 'Values'
                              ? '''Mission
                    True to our Catholic tradition and inspired by St. John Baptist de La Salle, University of St. La Salle forms persons of integrity and excellence, committed to the shared mission of caring for peoples and the Earth.
                    \nVision
                    University of St. La Salle is a premier, responsive learning community, advancing human and Christian education, through research, innovation, and social engagement in Asia and the Pacific, in the service of humanity.
                    \nCore values
                    \nFAITH - USLS Commits to form role models, who live with faith in GOD and with deep respect to one’s self and others.
                    \nSERVICE - USLS commits to nurture volunteerism and service moved by genuine concern and love for the poor.
                    \nCOMMUNION IN MISSION - USLS creates a harmonious community that celebrates the values and gifts of every person.
                    '''
                              : pres,
                      fontSize: 14,
                    ),
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
