import 'package:url_launcher/url_launcher.dart';

class Url_lancher_helper{
  Url_lancher_helper._();
  static Url_lancher_helper url = Url_lancher_helper._();
// //////////////////////Open web page in app////////////////////////////
  lanchurl(String url)async{
    launchUrl(Uri.parse(url),  mode: LaunchMode.platformDefault,webViewConfiguration: WebViewConfiguration(enableDomStorage: true));
  }
  openWebpage(String url) {
    try {
      lanchurl(url);
    } on Exception catch (e) {
      print(e);
    }
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
}