import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../util/constants.dart';

class Api extends ChangeNotifier {

  var user = null;

  Api(){
    user = FirebaseAuth.instance.currentUser;
  }

  // Get the score from firebase user's document
  Future<List> getScore(scoreName) async{

    //firebase auth instance to get uuid of user
    if(user != null){
      return FirebaseFirestore.instance
          .collection(FIRESTORE_USERS)
          .doc(user.uid).get().then((value) async{
            if(value.data() != null){
              if(value.data()!.containsKey(scoreName)){
                var data = value[scoreName];
                if(data != null && jsonDecode(data) != null) {
                  return jsonDecode(data);
                }
                return [];
              }
            } else {
              await setCollection();
              return [];
            }
            return [];
          });
    }
    return [];
  }

  // Set a new score record in the user's document
  Future<bool> setCollection() async{
    //firebase auth instance to get uuid of user
    if(user != null){
      await FirebaseFirestore.instance
        .collection(FIRESTORE_USERS).doc(user.uid).set({});
      return true;
    }
    return false;
  }

  // Set a new score record in the user's document
  Future<bool> updateScore(scoreName, scoreValue, savedScores) async{

    // if the savedScores length is longer than the limit then pop and push
    if(savedScores.length >= SCORE_LIMIT){
      savedScores.removeAt(0);
    }
    savedScores.add(scoreValue);
    scoreValue = jsonEncode(savedScores);

    //firebase auth instance to get uuid of user
    if(user != null){
      FirebaseFirestore.instance
        .collection(FIRESTORE_USERS).doc(user.uid).update({
          scoreName: scoreValue
        }
      );
      return true;
    }
    return false;
  }

  /// First get the scores
  /// If no scores have been gotten
  /// Then create new ones
  /// Else update them
  Future<List> processScore(scoreName, scoreValue) async{

    return getScore(scoreName).then((val) async{
      await updateScore(scoreName, scoreValue, val);
      return val;
    });
  }


  /// Get the average from a list if doubles
  String getAverageFromList(list){
    double avg = 0.0;
    for(var i = 0; i < list.length; i++){
      avg += list[i];
    }
    avg = avg/list.length;
    return avg.toStringAsFixed(2);
  }

}