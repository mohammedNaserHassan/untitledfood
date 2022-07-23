import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Models/Meal.dart';



class Ingredient extends StatelessWidget {
  Meal meal;

  Ingredient(this.meal);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10.h, left: 20.w),
        child: Text(
          meal.strIngredient1 ??
              '' + '\t,' + meal.strIngredient2 ??
              '' + '\t,' + meal.strIngredient3 ??
              '' + '\t,' + meal.strIngredient4 ??
              '' + '\t,' + meal.strIngredient5 ??
              '' + '\t,' + meal.strIngredient6 ??
              '' + '\t,' + meal.strIngredient7 ??
              '' + '\t,' + meal.strIngredient8 ??
              '' + '\t,' + meal.strIngredient9 ??
              '' + '\t,' + meal.strIngredient10 ??
              '' + meal.strIngredient11 ??
              '' + '\t,' + meal.strIngredient12 ??
              '' + '\t,' + meal.strIngredient13 ??
              '' + '\t,' + meal.strIngredient14 ??
              '' + '\t,' + meal.strIngredient15 ??
              '' + '\t,' + meal.strIngredient16 ??
              '' + '\t,' + meal.strIngredient17 ??
              '' + '\t,' + meal.strIngredient18 ??
              '' + '\t,' + meal.strIngredient19 ??
              '' + '\t,',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ));
  }
}
