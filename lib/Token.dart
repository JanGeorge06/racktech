import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';


String? email;
Future<String?> getTokenFromSharedPreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = await prefs.getString('token');
  return token;
}

void decodeToken() async {
  // Retrieve the token from SharedPreferences
  String? token = await getTokenFromSharedPreferences();

  if (token != null) {
    // Decode the token
    Map<String, dynamic>? decodedToken = Jwt.parseJwt(token);

    // Access the token claims
    email = decodedToken?['email'];
    }
    // Use the decoded token claims as needed
   else {
    // Token not found in SharedPreferences
    print('Token not found');
  }
}

Future<void> deleteUserToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('token');
}
