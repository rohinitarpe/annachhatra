import 'package:flutter/material.dart';
import 'package:annachhatra/models/food_data.dart';
import 'package:annachhatra/widgets/food_tile.dart';
import 'package:provider/provider.dart';

class FoodList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<FoodData>(
        builder: (context,foodData,child){
          return ListView.builder(
            shrinkWrap: true,
              itemBuilder: (context,index){
                final food = foodData.foods[index];
                return FoodTile(
                    foodTile: food.foodname,
                    quantityTile: food.foodquantity,
                   // isAvailable: food.isAvailable,
                    deletePressback: (){
                      foodData.deleteFood(food);
                    },
                //   checkboxCallback: (checkboxstate){
                //       foodData.updateFood(food);
                // },
                );
              },
            itemCount: foodData.foodCount,
          );
        }
    );
  }
}

class HotelList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<HotelData>(
        builder: (context,hotelData,child){
          return ListView.builder(
            shrinkWrap: true,
              itemBuilder: (context,index){
              final hotel = hotelData.hotels[index];
              return HotelTile(
                  hotelimageTile: hotel.hotelimage,
                  qunatityTile: hotel.qunatity,
                  namehotelTile: hotel.hotelname,
                  infohotelTile: hotel.hotelinfo,
                  onPressedTile: hotel.onViwbtn,
              );
              },
            itemCount: hotelData.hotelCount,
          );
    },
    );
  }
}
