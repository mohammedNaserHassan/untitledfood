import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:untitledfood/API/ApiHelper.dart';
import 'package:untitledfood/Models/Category.dart';
import 'package:untitledfood/Taps/Menu.dart';
import 'package:untitledfood/Taps/More.dart';
import 'package:untitledfood/Taps/Offers.dart';
import 'package:untitledfood/Taps/Profile.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:map_launcher/map_launcher.dart' as MapLuncher;

class MyProvider extends ChangeNotifier {
  MyProvider() {
    getMyLocation();
  }

/////Get All Categores////////////////
  List<dynamic> allCategories;

  getAllCategories() async {
    Map<dynamic, dynamic> categories =
        await ApiHelper.helper.getAllCategories();
    allCategories = categories['categories'];
    notifyListeners();
  }

///////////////////////////////////////////////////////

/////Set length of resturent ///////
int length=3;
  int lengthD=5;
  int lengthC=3;
  setLength(int len){
    this.length=len;
    notifyListeners();
  }
  setLengthD(int lengh){
    this.lengthD=lengh;
    notifyListeners();
  }
  setLengthC(int l){
    this.lengthC=l;
    notifyListeners();
  }
  /////////////

//////////////Get Specific Meal/////////////////////////
  Meal selectedProduct;

  getSpecificProduct(String id) async {
    Map<String, dynamic> response =
        await ApiHelper.helper.getSpecificProduct(id);
    selectedProduct = Meal.fromJson(response['meals'][0]);
    print(selectedProduct.strMeal);
    notifyListeners();
  }

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////

  ////////Increment and Decrement///////////
  int value = 1;

  increment() {
    value++;
    notifyListeners();
  }

  decrement() {
    if (value > 1) {
      value--;
    }
    notifyListeners();
  }
bool valueSwitch =false;
  changeSwitch(bool val){
    this.valueSwitch=val;
    notifyListeners();
  }
  //////////////////////////////
  List<bool> states= [false,false,false,false,false];
bool stateofWidgets = true;
  changeStates(int index){
    this.stateofWidgets=!this.stateofWidgets;
    this.states[index]=!this.states[index];
    notifyListeners();
  }
  ////////DropDown//////////
  String valueDrop;

  setValue(String value) {
    this.valueDrop = value;
    notifyListeners();
  }

  ////////////////////////////////////////////////////////////

//////////////////////////Get Meals by name categories/////////////////////////////
  String selectedCategory = '';
  List<dynamic> categoryProducts;

  getCategoryProducts(String category) async {
    this.selectedCategory = category;
    Map<dynamic, dynamic> products =
        await ApiHelper.helper.getCategoryProducts(category);
    categoryProducts = products['meals'];
    notifyListeners();
  }
  ////////////////////////////////////////////////////////////
  bool visible = false;
  //////////////////////////////////////////add floating action button to tabs ///////////////////////////////////////////////////////////////
bool isFloating = false;
  setFloating(){
    this.isFloating=true;
    notifyListeners();
  }
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////
  List<Widget> taps = [MenuTab(), OffersTab(), ProfileTab(), MoreTab()];

  ///////Get Meals By First Letter/////////////
List<dynamic> filteredPrducts;
  getMealByFirstLetter(String l)async{
    Map<dynamic, dynamic> products = await ApiHelper.helper.getMealsByFirstLetter(l);
    filteredPrducts=products['meals'];
  }

  List<dynamic> filteredPrductss;
  getMealByFirstLetters(String l)async{
    Map<dynamic, dynamic> products = await ApiHelper.helper.getMealsByFirstLetter(l);
    filteredPrductss=products['meals'];

  }

////////////////////////////////////////////////////////////


//////////////////////open in map application////////////////
  openMapLuncher(LatLng point) {
    MapLuncher.MapLauncher.showDirections(
        mapType: MapLuncher.MapType.google,
        destination: MapLuncher.Coords(point.latitude, point.longitude));
  }

////////////////OR////////////////////////////////
  void openMap(LatLng point) async {
    String url =
        'https://www.google.com/maps/search/?api=1&query=${point.latitude},${point.longitude}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

////////////////////////////////////////////////////////////////////////////////

  ////////////////Go with animation to the point////////////////
  Set<Marker> markers = {};
  GoogleMapController controller;
  LatLng myLocation;

  animateCameraPostion(LatLng latLng) {
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: latLng, zoom: 11)));
  }

////////////////////////////////////////////////////////////////////////////////////////////////

  ////////////////Get Your Location////////////////////////////////

  getMyLocation() async {
    Position position = await Geolocator.getCurrentPosition();
    this.myLocation = LatLng(position.latitude, position.longitude);
    notifyListeners();
  }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  ////////////////Add marker to the point selected////////////////////////////////
  addMarkerToSet(Marker marker) {
    this.markers.add(marker);
    notifyListeners();
  }

////////////////////////////////////////////////////////////////////////////////////////////////

  ////////////////Scaffod and Bottom navigation bar////////////////////////////////
  String titleScaffod = 'Menu';
  int selectedIndex = 0;

  void onChangeTab(int index) {
    selectedIndex = index;
   this.isFloating=false;
    switch (selectedIndex) {
      case 0:
        titleScaffod = 'Menu';
        break;
      case 1:
        titleScaffod = 'Latest Offers';
        break;
      case 2:
        titleScaffod = 'Profile';
        break;
      case 3:
        titleScaffod = 'More';
        break;
      case 4:
        titleScaffod = 'Good morning';
    }
    notifyListeners();
  }
  setSelectefIndex(){
    this.titleScaffod='Good morning';
    notifyListeners();
  }
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
}
