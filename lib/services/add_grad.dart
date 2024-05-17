import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future addGraduate(
    college, courses, batch, name, moto, img, course, section) async {
  final docUser = FirebaseFirestore.instance.collection('Graduates').doc();

  final json = {
    'college': college,
    'courses': courses,
    'batch': batch,
    'name': name,
    'moto': moto,
    'img': img,
    'course': course,
    'section': section,
    'dateTime': DateTime.now()
  };

  await docUser.set(json);
}
