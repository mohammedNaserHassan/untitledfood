import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:untitledfood/Providers/MyProvider.dart';
import 'package:untitledfood/Widgets/CardIcon.dart';
import 'package:untitledfood/Widgets/myDropDown.dart';

class MealDetails extends StatefulWidget {
  static final routeName = 'Details';
  String id;
  String tag;

  MealDetails({this.id,this.tag});

  @override
  _MealDetailsState createState() => _MealDetailsState();
}

class _MealDetailsState extends State<MealDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<MyProvider>(context, listen: false)
        .getSpecificProduct(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0),
      child: Consumer<MyProvider>(
          builder: (context, provider, v) => provider.selectedProduct == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(
                  children: [
                    Container(
                      child: Hero(
                        tag: widget.tag,
                        child: CachedNetworkImage(
                          imageUrl: provider.selectedProduct.strMealThumb,
                        ),
                      ),
                    ),
                    Positioned(
                        top: 40,
                        left: 20,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )),
                    Positioned(
                        top: 40,
                        right: 20,
                        child: CardIcon(
                          color: Colors.white,
                        )),
                    Positioned(
                        top: 370,
                        child: Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(0.0, 1.0), //(x,y)
                                )
                              ],
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(40),
                                topLeft: Radius.circular(40),
                              )),
                          width: MediaQuery.of(context).size.width,
                          height: 500,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    margin: EdgeInsets.only(top: 30, left: 20),
                                    child: Text(
                                      provider.selectedProduct.strMeal,
                                      style: TextStyle(fontSize: 22),
                                    )),
                                Container(
                                  margin: EdgeInsets.only(top: 10, left: 280),
                                  child: Text(
                                    'RS.' + '\t' + '200',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    '/\tper Portion',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                  margin: EdgeInsets.only(left: 310),
                                ),
                                Container(
                                    margin: EdgeInsets.only(top: 10, left: 20),
                                    child: Text(
                                      'Description',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Container(
                                    margin: EdgeInsets.only(top: 30, left: 20),
                                    child: Text(
                                      provider.selectedProduct.strInstructions
                                              .substring(0, 280) +
                                          '.',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    )),
                                Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Divider(color: Colors.grey)),
                                Container(
                                    margin: EdgeInsets.only(
                                      top: 10,
                                      left: 20,
                                    ),
                                    child: Text(
                                      'Ingredient',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Container(
                                    margin: EdgeInsets.only(top: 10, left: 20),
                                    child: Text(
                                      provider.selectedProduct.strIngredient1 ??
                                          '' +
                                              '\t,' +
                                              provider.selectedProduct
                                                  .strIngredient2 ??
                                          '' +
                                              '\t,' +
                                              provider.selectedProduct
                                                  .strIngredient3 ??
                                          '' +
                                              '\t,' +
                                              provider.selectedProduct
                                                  .strIngredient4 ??
                                          '' +
                                              '\t,' +
                                              provider.selectedProduct
                                                  .strIngredient5 ??
                                          '' +
                                              '\t,' +
                                              provider.selectedProduct
                                                  .strIngredient6 ??
                                          '' +
                                              '\t,' +
                                              provider.selectedProduct
                                                  .strIngredient7 ??
                                          '' +
                                              '\t,' +
                                              provider.selectedProduct
                                                  .strIngredient8 ??
                                          '' +
                                              '\t,' +
                                              provider.selectedProduct
                                                  .strIngredient9 ??
                                          '' +
                                              '\t,' +
                                              provider.selectedProduct
                                                  .strIngredient10 ??
                                          '' +
                                              provider.selectedProduct
                                                  .strIngredient11 ??
                                          '' +
                                              '\t,' +
                                              provider.selectedProduct
                                                  .strIngredient12 ??
                                          '' +
                                              '\t,' +
                                              provider.selectedProduct
                                                  .strIngredient13 ??
                                          '' +
                                              '\t,' +
                                              provider.selectedProduct
                                                  .strIngredient14 ??
                                          '' +
                                              '\t,' +
                                              provider.selectedProduct
                                                  .strIngredient15 ??
                                          '' +
                                              '\t,' +
                                              provider.selectedProduct
                                                  .strIngredient16 ??
                                          '' +
                                              '\t,' +
                                              provider.selectedProduct
                                                  .strIngredient17 ??
                                          '' +
                                              '\t,' +
                                              provider.selectedProduct
                                                  .strIngredient18 ??
                                          '' +
                                              '\t,' +
                                              provider.selectedProduct
                                                  .strIngredient19 ??
                                          '' + '\t,',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    )),
                                //
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 30),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: MyDropDown(
                                    hint: '-Select the size of portion-',
                                    t1: "Small",
                                    t2: "Medium",
                                    t3: "Large",
                                  )
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        'Number of Portions',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: IconButton(
                                            onPressed: () {
                                              provider.decrement();
                                            },
                                            icon: Icon(
                                              Icons.remove,
                                              color: Colors.white,
                                              size: 15,
                                            )),
                                        width: 60,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: Colors.deepOrangeAccent),
                                      ),
                                      Container(
                                        child: Center(
                                            child: Text(
                                          provider.value.toString(),
                                          style: TextStyle(
                                              color: Colors.deepOrange),
                                        )),
                                        width: 60,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: Colors.white,
                                            border: Border.all(
                                                color: Colors.deepOrange)),
                                      ),
                                      Container(
                                        child: IconButton(
                                            onPressed: () {
                                              provider.increment();
                                            },
                                            icon: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                              size: 12,
                                            )),
                                        width: 60,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: Colors.deepOrangeAccent),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          width: 120,
                                          height: 180,
                                          decoration: BoxDecoration(
                                              color: Colors.deepOrange,
                                              borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(80),
                                                topRight: Radius.circular(80),
                                                topLeft: Radius.circular(15),
                                                bottomLeft: Radius.circular(15),
                                              )),
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 40, horizontal: 40),
                                          width: 300,
                                          height: 100,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text('Total Price'),
                                              Text(
                                                'LKR' + '\t' + '200',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                              Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Icon(
                                                      Icons.shopping_cart,
                                                      color: Colors.white,
                                                      size: 10,
                                                    ),
                                                    Text(
                                                      'Add toCart',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )
                                                  ],
                                                ),
                                                width: 100,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    color: Colors.deepOrange,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            60)),
                                              ),
                                            ],
                                          ),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 2.0,
                                                  spreadRadius: 0.0,
                                                  offset: Offset(2.0, 2.0),
                                                )
                                              ],
                                              borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(15),
                                                topRight: Radius.circular(15),
                                                topLeft: Radius.circular(40),
                                                bottomLeft: Radius.circular(40),
                                              )),
                                        ),
                                        Positioned(
                                          right: 20,
                                          top: 70,
                                          child: Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey,
                                                    blurRadius: 2.0,
                                                    spreadRadius: 0.0,
                                                    offset: Offset(2.0, 2.0),
                                                  )
                                                ],
                                                color: Colors.white,
                                                shape: BoxShape.circle),
                                            child: Icon(
                                              Icons.shopping_cart,
                                              color: Colors.deepOrangeAccent,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 50,
                                )
                              ],
                            ),
                          ),
                        )),
                    Positioned(
                        top: 350,
                        right: 20,
                        child: Transform.rotate(
                          angle: 120,
                          child: Card(
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.favorite_sharp,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        )),
                  ],
                )),
    );
  }
}
