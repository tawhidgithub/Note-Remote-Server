import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:not_remote_server/res/Utils/Utils.dart';

import '../model/notes_model.dart';
import '../res/session Controller.dart';

class HomeController extends GetxController {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final updateTitleController = TextEditingController();
  final updateDescriptionController = TextEditingController();
  RxList<NotesModel> notesList = <NotesModel>[].obs;
  DatabaseReference ref = FirebaseDatabase.instance.ref().child("Notes");
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
  }

  /// Fetch Notes
  void fetchData() async {
    try {
      notesList.clear();
      DatabaseReference ref = FirebaseDatabase.instance.ref().child("Notes");
      String? userID = sessionController().userId.toString();
      await ref.child(userID).get().then((DataSnapshot snapshot) {
        if (snapshot.exists) {
          Map<Object?, Object?> data = snapshot.value as Map<Object?, Object?>;
          if (data.isNotEmpty) {
            data.forEach((key, value) {
              if (value is Map<Object?, dynamic>) {
                NotesModel notesModel = NotesModel(
                    title: value['title'],
                    description: value['description'],
                    id: value['id'],
                    key: value['key']);
                notesList.add(notesModel);
              }
            });
          }
        } else {

          if (kDebugMode) {
            print("________________________No data available for the user.");
          }
        }
      }).onError((error, context) {

        if (kDebugMode) {
          print("________________________$error");
        }
      });
    } catch (e) {
      print("Fatch Error is $e");
    }
  }

  ///Upload Notes
  void uploadData(BuildContext context) async {
    try {
      String? userID = sessionController().userId.toString();

      if (userID != null && userID.isNotEmpty) {
        String? _key = ref.push().key;
        if (_key != null) {
          ref.child(userID).child(_key).set({
            'id': notesList.length.toString(),
            'key': _key,
            'title': titleController.text,
            'description': descriptionController.text,
          }).then((value) {
            fetchData();
            titleController.text = "";
            descriptionController.text = "";
            GoRouter.of(context).go('/home');
          });
        }
      } else {
        Utils().ErrorMesege('userUd is in Empty');
      }
    } catch (e) {
      print("Fatch Error is $e");
    }
  }


  /// upgrade notes
  void upgradeData(BuildContext context, key) async {
    try {
      String? userID = sessionController().userId.toString();

      if (userID != null && userID.isNotEmpty) {
        if (key != null) {
          ref.child(userID).child(key).set({
            'id': notesList.length.toString(),
            'key': key,
            'title': updateTitleController.text,
            'description': updateDescriptionController.text,
          }).then((value) {
            fetchData();
            updateTitleController.text = "";
            updateTitleController.text = "";
            GoRouter.of(context).go('/home');
          });
        }
      } else {
        Utils().ErrorMesege('userUd is in Empty');
      }
    } catch (e) {
      print("Fatch Error is $e");
    }
  }

  /// delete note
  void deleteNots(String key) async {
    try {
      String? userID = sessionController().userId.toString();

      if (userID != null && userID.isNotEmpty) {
        DatabaseReference deleteRef = FirebaseDatabase.instance
            .ref()
            .child("Notes")
            .child(userID)
            .child(key);

        if (key != null) {
          await deleteRef.remove().then((value) {
            fetchData();
          });
        }
      } else {
        Utils().ErrorMesege('userUd is in Empty');
      }
    } catch (e) {
      print("Fatch Error is $e");
    }
  }
}
