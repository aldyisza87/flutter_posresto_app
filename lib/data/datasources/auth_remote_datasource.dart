import 'package:dartz/dartz.dart';
import 'package:flutter_posresto_app/core/constants/variables.dart';
import 'package:flutter_posresto_app/data/models/response/auth_response_model.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDatasource {
  Future<Either<String, AuthResponseModel>> login(
      String email, String password) async {
    final url = Uri.parse('${Variables.baseUrl}/api/login');
    final reponse = await http.post(
      url,
      body: {
        'email': email,
        'password': password,
      },
    );

    if (reponse.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(reponse.body));
    } else {
      return const Left('Failed to login');
    }
  }
}
