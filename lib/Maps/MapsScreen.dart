import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:untitledfood/Providers/MyProvider.dart';
import 'package:untitledfood/Widgets/SearchWidget.dart';

class MapScreen extends StatelessWidget {
  LatLng gaza = LatLng(31.24, 34.19);
  MapScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios),
              color: Colors.black,
            ),
            Text(
              'Change address ',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: Consumer<MyProvider>(
        builder: (context, provider, v) => SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 40.h, bottom: 10.h),
                width: double.infinity,
                height: 560,
                child: provider.myLocation==null?
                    Center(child: CircularProgressIndicator(),)
                    :GoogleMap(
                  onTap: (LatLng x){
                    provider.addMarkerToSet(Marker(
                        markerId: MarkerId('MyLocation+${x.latitude}'),
                        position: x));
                    ///////
                    provider.openMapLuncher(x);
                  },
                  markers: provider.markers,
                  onMapCreated: (x) {
                    provider.controller = x;
                  },
                  initialCameraPosition: CameraPosition(
                    target: provider.myLocation,
                    zoom: 8.0,
                  ),
                ),
              ),
             SearchWidget(label: 'Search address',),
              ListTile(
                onTap: () {
                  provider.openMapLuncher(LatLng(60,89.3));
                },
                title: Text('Choose a saved pace'),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                ),
                leading: CircleAvatar(
                  backgroundColor: Colors.orange.withOpacity(0.3),
                  child: Icon(
                    Icons.star,
                    color: Colors.deepOrange,
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
