import 'dart:collection';
import 'package:annachhatra/models/add_dish.dart';
import 'package:annachhatra/screens/fooddetail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:annachhatra/models/add_dish.dart';

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

// class HotelData extends ChangeNotifier{
//   List<Hotel> hotels =[
//     Hotel(
//         hotelimage: 'images/hotel-green.png',
//         hotelname: 'Hotel Green Leaf',
//         hotelinfo: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Odio et convallis euismod',
//         ),
//     Hotel(
//         hotelimage: 'images/hotel-marina.jpg',
//         hotelname: 'Hotel Marina',
//         hotelinfo: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Odio et convallis euismod',
//        ),
//     Hotel(
//         hotelimage: 'images/hotel-park.jpg',
//         hotelname: 'Hotel The Park',
//         hotelinfo: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Odio et convallis euismod',
//         ),
//   ];
//   UnmodifiableListView<Hotel> get hotel{
//    return UnmodifiableListView(hotels);
//   }
//   int get hotelCount{
//     return hotels.length;
//   }
//   void addHotel(String newHotelImage,String newHotelName,String newHotelInfo,String newQuantity,String onViewPressed){
//     final hotel = Hotel(hotelimage: newHotelImage, hotelname: newHotelName, hotelinfo: newHotelInfo,
//       //qunatity: newQuantity, onViwbtn: onViewPressed,
//     );
//     hotels.add(hotel);
//     notifyListeners();
//   }
// }
