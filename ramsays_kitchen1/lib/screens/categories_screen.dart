// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:ramsays_kitchen1/database/database.dart';
import 'package:ramsays_kitchen1/models/category.dart';
//import 'package:ramsays_kitchen1/models/meal.dart';

// import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List categoryList = [];
  List mealsList = [];

  @override
  void initState() {
    super.initState();
    fetchCategoryList();
    // fetchmealsList();
  }

  // fetchmealsList() async {
  //   List result = await Database().getMeals();

  //   if (result == null) {
  //     print("Unable to retrive data");
  //   } else {
  //     List newList = [];

  //     var len = result.length;
  //     for (var i = 0; i < len; i++) {
  //       var element = result[i];

  //       print(element['title']);

  //       newList.add(Meal(
  //           id: element['id'],
  //           categories: element['categories'],
  //           title: element['title'],
  //           imageUrl: element['imageUrl'],
  //           ingredients: element['ingredients'],
  //           steps: element['steps'],
  //           duration: element['duration'],
  //           complexity: element['steps'].length <= 3
  //               ? Complexity.Simple
  //               : (element['steps'].length >= 6
  //                   ? Complexity.Hard
  //                   : Complexity.Challenging),
  //           affordability: element['ingredients'].length <= 3
  //               ? Affordability.Affordable
  //               : (element['ingredients'].length >= 6
  //                   ? Affordability.Luxurious
  //                   : Affordability.Pricey),
  //           isGlutenFree: element['isGlutenFree'],
  //           isLactoseFree: element['isLactoseFree'],
  //           isVegan: element['isVegan'],
  //           isVegetarian: element['isVegetarian']));

  //       setState(() {
  //         mealsList = newList;
  //       });
  //     }
  //   }
  // }

  fetchCategoryList() async {
    List result = await Database().getCategories();

    if (result == null) {
      print("Unable to retrive data");
    } else {
      List newList = [];
      var len = result.length;
      for (var i = 0; i < len; i++) {
        var element = result[i];
        newList.add(Category(
            id: element['id'],
            title: element['title'],
            color: i % 3 == 0
                ? Colors.orange
                : (i % 3 == 1 ? Colors.purple : Colors.blue)));
      }
      // result.forEach((element) =>
      //     [newList.add(Category(id: element['id'], title: element['title']))]);
      setState(() {
        categoryList = newList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      children: categoryList
          .map(
            (catData) => CategoryItem(
              catData.id,
              catData.title,
              catData.color,
            ),
          )
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
} 


// class CategoriesScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GridView(
//       padding: const EdgeInsets.all(25),
//       children: DUMMY_CATEGORIES
//           .map(
//             (catData) => CategoryItem(
//               catData.id,
//               catData.title,
//               catData.color,
//             ),
//           )
//           .toList(),
//       gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//         maxCrossAxisExtent: 200,
//         childAspectRatio: 3 / 2,
//         crossAxisSpacing: 20,
//         mainAxisSpacing: 20,
//       ),
//     );
//   }
// }
