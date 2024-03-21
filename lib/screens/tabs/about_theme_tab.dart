import 'package:flutter/material.dart';
import 'package:yearbook_app/widgets/text_widget.dart';

class AboutThemeTab extends StatelessWidget {
  const AboutThemeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(
                align: TextAlign.start,
                text:
                    'About the Theme: Afterglow—Chromatic Parallels, A Colorful Aftermath!',
                fontSize: 16,
                fontFamily: 'Bold',
                color: Colors.black,
              ),
              const SizedBox(
                height: 10,
              ),
              TextWidget(
                align: TextAlign.start,
                text: '''
              Within the pages of our yearbook lies the vibrant narrative of our collective journey, encapsulated by the theme "Afterglow—Chromatic Parallels." Like a radiant sunset casting its myriad hues across the sky, our time together has been a tapestry of diverse experiences, each color representing a unique facet of our shared story.
              ''',
                fontSize: 14,
                fontFamily: 'Regular',
                color: Colors.grey,
              ),
              const SizedBox(
                height: 10,
              ),
              TextWidget(
                align: TextAlign.start,
                text: 'Painting the Masterpiece',
                fontSize: 16,
                fontFamily: 'Bold',
                color: Colors.black,
              ),
              const SizedBox(
                height: 10,
              ),
              TextWidget(
                align: TextAlign.start,
                text: '''
              In the tapestry of our lives, it's the colorful connections that weave together to create our beautiful masterpiece. From the earliest chapters of our journey to the present moment, every interaction, every shared laughter, and every shared challenge has contributed to the brilliance of our collective afterglow.
              ''',
                fontSize: 14,
                fontFamily: 'Regular',
                color: Colors.grey,
              ),
              const SizedBox(
                height: 10,
              ),
              TextWidget(
                align: TextAlign.start,
                text: 'PAST',
                fontSize: 16,
                fontFamily: 'Bold',
                color: Colors.black,
              ),
              const SizedBox(
                height: 10,
              ),
              TextWidget(
                align: TextAlign.start,
                text: '''
              Reflecting on our past, we recognize the significance of our humble beginnings. From tentative first steps as freshmen to the confident strides of today, every stumble and every triumph has been a lesson in resilience and growth. Our past serves as a foundation upon which we build our futures.
              
              ''',
                fontSize: 14,
                fontFamily: 'Regular',
                color: Colors.grey,
              ),
              const SizedBox(
                height: 10,
              ),
              TextWidget(
                align: TextAlign.start,
                text: 'PRESENT',
                fontSize: 16,
                fontFamily: 'Bold',
                color: Colors.black,
              ),
              const SizedBox(
                height: 10,
              ),
              TextWidget(
                align: TextAlign.start,
                text: '''
              As we navigate the final chapter of our college journey, we find ourselves immersed in a kaleidoscope of experiences. The adventures we've embraced, the challenges we've overcome, and the friendships we've forged have all shaped us into the individuals we are today. Our present is a testament to our strength, resilience, and unwavering spirit.
              
              ''',
                fontSize: 14,
                fontFamily: 'Regular',
                color: Colors.grey,
              ),
              const SizedBox(
                height: 10,
              ),
              TextWidget(
                align: TextAlign.start,
                text: 'FUTURE',
                fontSize: 16,
                fontFamily: 'Bold',
                color: Colors.black,
              ),
              const SizedBox(
                height: 10,
              ),
              TextWidget(
                align: TextAlign.start,
                text: '''
              As we stand on the threshold of tomorrow, we are filled with anticipation for the possibilities that lie ahead. Our hopes and dreams, penned in letters to our future selves, serve as beacons of light guiding us forward. Armed with ambition and optimism, we step into the unknown, ready to write the next chapter of our lives.
\nIn embracing every step of our journey, we bask in the radiant glow of our collective afterglow. Together, we celebrate not only the milestones that mark our progress but also the moments of joy, laughter, and camaraderie that define our shared experience. As we turn the pages of this yearbook, let us revel in the beauty of our chromatic parallels, for it is in our diversity that we find our greatest strength.

              ''',
                fontSize: 14,
                fontFamily: 'Regular',
                color: Colors.grey,
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
