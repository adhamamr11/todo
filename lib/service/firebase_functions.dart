import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/models/user_model.dart';

class FirebaseFunctions {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static CollectionReference<TaskModel> mainTaskFunction() {
    return firestore.collection("Tasks").withConverter(
      fromFirestore: (snapshot, options) {
        return TaskModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.toJson();
      },);
  }

  static CollectionReference<UserModel> mainUserFunction() {
    return firestore.collection("Users").withConverter(
      fromFirestore: (snapshot, options) {
        return UserModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.toJson();
      },);
  }


  static Future<void> addUser(UserModel user)async{
    var ref = mainUserFunction();
    await ref.doc(user.id).set(user);
  }



  static Future<void> addTask(TaskModel task) async {
    var ref = mainTaskFunction();
    var docRef = ref.doc();
    task.id = docRef.id;
    task.userId = FirebaseAuth.instance.currentUser?.uid ?? "";
    return docRef.set(task);
  }

  static Stream<QuerySnapshot<TaskModel>> getTask(DateTime date) {
    String userId = FirebaseAuth.instance.currentUser?.uid ?? "";
    var ref = mainTaskFunction();
    return ref.where("date", isEqualTo: DateUtils
        .dateOnly(date)
        .millisecondsSinceEpoch).where("userId",isEqualTo: userId ).snapshots();
  }

  static void deleteTask(String id) async {
    var ref = mainTaskFunction();
    await ref.doc(id).delete();
  }

  static void setDone(TaskModel task) async {
    var ref = mainTaskFunction();
    task.isDone = !task.isDone;
    await ref.doc(task.id).update(task.toJson());
  }


  static createAccount(String email, String password,String name, String phone) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      credential.user!.sendEmailVerification();
      addUser(UserModel(name: name, phone: phone, id: credential.user?.uid?? "", email: email));
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      throw e;
    } catch (e) {
      throw e;
      print(e);
    }
  }

  static Future<UserModel> getUser()async{
    String userId = FirebaseAuth.instance.currentUser?.uid?? "";
    var ref = mainUserFunction();
    var docRef = await ref.doc(userId).get();
    return docRef.data()!;
  }


  static Future<UserCredential> loginAccount(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      throw e.toString();
      } catch(e){
      throw e.toString();
    }
      }


  static Future<void> updateTask(TaskModel task) async {
    var ref = mainTaskFunction();
    await ref.doc(task.id).update(task.toJson());
  }

    }
