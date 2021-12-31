import 'package:url_launcher/url_launcher.dart';

class Url_lancher_helper{
  Url_lancher_helper._();
  static Url_lancher_helper url = Url_lancher_helper._();

  lanchurl(String url)async{
    launch(url,universalLinksOnly: true);
  }
  openWebpage(String url) {
    try {
      lanchurl(url);
    } on Exception catch (e) {
      print(e);
    }
  }
}