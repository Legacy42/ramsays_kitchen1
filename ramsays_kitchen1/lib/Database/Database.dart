import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final CollectionReference categoryList =
      FirebaseFirestore.instance.collection('categories');

  Future getCategories() async {
    List categories = [];

    try {
      await categoryList.get().then((snapshot) => [
            snapshot.docs.forEach((element) {
              categories.add(element.data());
            })
          ]);

      return categories;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
