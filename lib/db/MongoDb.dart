import 'dart:convert';
import 'dart:developer';

import 'package:crypto/crypto.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:yourmood/db/cnst.dart';

class Mng {
static connect() async {
  var db = await Db.create(MONGO_URL);
  await db.open();
  inspect(db);
  var userCollection = db.collection("users");
}


  String hashPassword(String password) {
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

Future<void> insertUser(String username, String email, String password) async {
  var db = await Db.create(MONGO_URL);
  await db.open();
  var userCollection = db.collection("users");

  userCollection.insertOne(
    {
      'username': username,
      'email': email,
      'password': hashPassword(password)
    }
  );
  // close the database connection when done
  await db.close();
}

Future<bool> credentialsValidation(String emailOrUsername, String password) async {
  var db = await Db.create(MONGO_URL);
  await db.open();
  var userCollection = db.collection("users");

  var query = {
    '\$or': [
      {'email': emailOrUsername},
      {'username': emailOrUsername}
    ],
    'password': hashPassword(password)
  };

  var result = await userCollection.findOne(query);
  await db.close();

  if (result == null) {
    return false; // Invalid credentials
  } else {
    return true; // Valid credentials
  }
}

}


