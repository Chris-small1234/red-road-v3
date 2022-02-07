import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FirebaseManager {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final users = FirebaseFirestore.instance.collection('users');
  final quotesCollection = FirebaseFirestore.instance.collection('quotes');
  var todayQuote;
  late String sectionType;
  int day = 0;

  Future<void> writeDate(int day, String sectionType) async {
    String uid = auth.currentUser!.uid.toString();
    if (sectionType == "mental") {
      users.doc(uid).set(
        {"mentalDay": day},
        SetOptions(merge: true),
      );
    } else if (sectionType == "physical") {
      users.doc(uid).set(
        {"physicalDay": day},
        SetOptions(merge: true),
      );
    } else if (sectionType == "relational") {
      users.doc(uid).set(
        {"relationalDay": day},
        SetOptions(merge: true),
      );
    } else if (sectionType == "spiritual") {
      users.doc(uid).set(
        {"spiritualDay": day},
        SetOptions(merge: true),
      );
    } else if (sectionType == "home") {
      users.doc(uid).set(
        {"homeDay": day},
        SetOptions(merge: true),
      );
    }
  }

  Future<int> readDate(int day, String sectionType) async {
    String uid = auth.currentUser!.uid.toString();
    var docSnapshot = await users.doc(uid).get();
    Map<String, dynamic>? data = docSnapshot.data();
    if (sectionType == "mental") {
      day = data?['mentalDay'];
    } else if (sectionType == "physical") {
      day = data?['physicalDay'];
    } else if (sectionType == "relational") {
      day = data?['relationalDay'];
    } else if (sectionType == "spiritual") {
      day = data?['spiritualDay'];
    } else if (sectionType == "home") {
      day = data?['homeDay'];
    }
    return day;
  }

  Future<List<String>?> readQuote(var quoteList) async {
    try {
      var docSnapshot =
          await quotesCollection.doc('0Qf04X6FrRs4SLLXtaIB').get();
      Map<String, dynamic>? data = docSnapshot.data();
      if (data != null) {
        quoteList = new List<String>.from(data['quoteArray']);
      }
    } catch (Exception) {
      print('Quote List Null');
    }
    return quoteList;
  }
}
