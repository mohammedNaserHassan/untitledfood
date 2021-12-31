import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitledfood/API/URLLauncher.dart';
import 'package:untitledfood/Providers/MyProvider.dart';
import 'package:untitledfood/Widgets/CustomButton.dart';

class OffersTab extends StatelessWidget {
  OffersTab();

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (context, provider, c) => Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(left: 30, bottom: 30),
                  child: Text(
                    'Find discounts , offer special',
                    style: TextStyle(color: Colors.grey),
                  )),
              Container(
                  height: 55,
                  width: 255,
                  child: CustomButton(
                    text: 'Check Offers',
                    textcolor: Colors.white,
                    fill: Color(0xfffc6011),
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.71,
                child: provider.filteredPrducts == null
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: provider.filteredPrducts.length,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () async {
                            Url_lancher_helper.url.openWebpage(
                                provider.filteredPrducts[index]['strYoutube']);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child: CachedNetworkImage(
                                  imageUrl: provider.filteredPrducts[index]
                                      ['strMealThumb'],
                                ),
                              ),
                              Text(
                                provider.filteredPrducts[index]['strMeal'],
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(provider.filteredPrducts[index]
                                  ['strCategory']),
                            ],
                          ),
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
