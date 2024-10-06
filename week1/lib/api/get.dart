import "dart:convert";
import 'package:week1/static.dart';
import "package:http/http.dart" as http;
import "package:week1/model/newsapi.dart";

class GetApi {
  //function
  Future<NewsApi?> getNewsApiCall() async {
    try {
      var url = Uri.https(StaticValue.baseURL, '/v2/everything',
          {'q': 'tesla', 'apiKey': StaticValue.apiKey});

      var response = await http.get(url, headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Cache-Control': 'no-cache, private,no-store,must-revalidate',
      });

      if (response.statusCode.toString().contains("20")) {
        var jsonData = jsonDecode(response.body);
        NewsApi newsdata = NewsApi.fromJson(jsonData);
        return newsdata;
      } else {
        return null;
      }
    } catch (e) {
      var jsonData = json.decode(StaticValue.dummydata);
      NewsApi newsApi = NewsApi.fromJson(jsonData);
      return newsApi;
    }
  }
}
