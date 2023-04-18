import 'package:flutter/material.dart';
import 'package:annachhatra/models/add_dish.dart';

class FoodTile extends StatelessWidget {

  //final bool isAvailable;
  final String foodTile;
  final String quantityTile;
  dynamic deletePressback;
 // dynamic checkboxCallback;

  FoodTile({
    //required this.isAvailable,
    required this.foodTile,
    required this.quantityTile,
  required this.deletePressback,
    //required this.checkboxCallback,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title:
        Column(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: deletePressback,
                        icon: Image.asset('images/delete_icon.png'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 80),
                      child: Text(
                        foodTile,
                      ),
                    ),
                    SizedBox(width: 50,),
                    Text(
                        quantityTile
                    ),
                  ],
                ),
                // Checkbox(
                //     value: isAvailable,
                //     onChanged: checkboxCallback,
                // ),
              ],
            ),
          ],
        ),
      
      // trailing: Checkbox(
      //     value: isAvailable,
      //     onChanged: checkboxCallback),
    );
  }
}
