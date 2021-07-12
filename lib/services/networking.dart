import 'package:http/http.dart' as http;
import 'dart:convert';

class Networkhelper
{
  Networkhelper({this.url});
  final String url;

  Future getData() async
  {
    http.Response res= await http.get(url);
      if(res.statusCode==200) {

        var data=jsonDecode(res.body);

        return data;
      }
      else
        print(res.statusCode);
  }

}
