import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitledfood/Providers/MyProvider.dart';
import 'package:untitledfood/UIScreens/MealsCategory.dart';
import 'package:untitledfood/Widgets/SearchWidget.dart';

class MenuTab extends StatelessWidget {
  MenuTab();

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (context, provider, c) => Container(
        color: Colors.white,
        child: Column(
          children: [
            SearchWidget(label: 'Search food'),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    bottom: 20.0,
                    left: 0.0,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      width: 100,
                      height: 570,
                      decoration: BoxDecoration(
                          color: Colors.deepOrangeAccent,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(80),
                            bottomRight: Radius.circular(80),
                          )),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    bottom: 20.0,
                    left: 10.0,
                    right: 10.0,
                    child: provider.allCategories == null
                        ? CircularProgressIndicator()
                        : ListView.builder(
                            itemCount: provider.allCategories.length,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                        builder: (_) => MealsCategory(
                                              name:
                                                  provider.allCategories[index]
                                                      ['strCategory'],
                                            )));
                              },
                              child: Stack(
                                fit: StackFit.passthrough,
                                children: [
                                  Positioned(
                                    child: Container(
                                      height: 80,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 40, vertical: 10),
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey.shade100),
                                          ],
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(70),
                                            topLeft: Radius.circular(70),
                                            bottomRight: Radius.circular(15),
                                            topRight: Radius.circular(15),
                                          )),
                                      child: Container(
                                        margin:
                                            EdgeInsets.only(top: 15, left: 70),
                                        child: Text(
                                          provider.allCategories[index]
                                              ['strCategory'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: CircleAvatar(
                                      backgroundColor:
                                          Color.fromARGB(0, 0, 0, 1),
                                      radius: 50,
                                      child: CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        imageUrl: provider.allCategories[index]
                                            ['strCategoryThumb'],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    bottom: 0.0,
                                    right: 20.0,
                                    child: CircleAvatar(
                                        backgroundColor:
                                            Colors.grey.withOpacity(0.2),
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.orange,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
