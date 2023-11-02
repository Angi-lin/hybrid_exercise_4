// import 'package:hybrid_exercise_4/hybrid_exercise_4.dart' as hybrid_exercise_4;
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main() async {
  try {
    var uri = Uri.parse('https://random-data-api.com/api/v2/users?size=10');
    final response = await http.get(uri); // http get request
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
      for (var item in jsonResponse) {
        print('${item["first_name"] + " " + item["last_name"]} ${item["uid"]}');
      }

      // String extractedList = jsonResponse.map((item) {
      //   return '${item["first_name"] + " " + item["last_name"]} ${item["uid"]} \n';
      // }).join('');
      // print(extractedList);
      // List<Map<String, String>> listOfMaps =
      //     List<Map<String, String>>.from(jsonResponse.map((item) {
      //   return Map<String, String>.from(item);
      // }));
    } else {
      throw 'Request failed with status: ${response.statusCode}.';
    }
  } catch (err) {
    print(err);
  }
}
