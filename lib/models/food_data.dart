import 'dart:collection';
import 'package:annachhatra/models/add_dish.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:annachhatra/models/add_dish.dart';
import 'dart:collection';

class FoodData extends ChangeNotifier{
  List<Food> _foods = [
    Food(foodname: 'Paneer Masala',foodquantity: '2'),
    Food(foodname: 'Chicken Kebab', foodquantity: '10'),
  ];
  UnmodifiableListView<Food> get foods{
    return UnmodifiableListView(_foods);
  }
  int get foodCount{
    return _foods.length;
  }
  void addFood(String newFoodName,String newFoodQuantity){
    final food = Food(foodname: newFoodName, foodquantity: newFoodQuantity);
    _foods.add(food);
    notifyListeners();
  }
  void updateFood(Food food){
    food.isAvailable;
    notifyListeners();
  }
  void deleteFood(Food food){
    _foods.remove(food);
    notifyListeners();
  }

}

