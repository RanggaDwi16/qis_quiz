import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:qis_quiz/core/provider/token_manager_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_provider.g.dart';

final baseUrl = dotenv.env['BASE_URL'];
@riverpod
Dio dio(DioRef ref) {
  final dio = Dio();
  dio.options.baseUrl = baseUrl!;
  dio.options.connectTimeout = const Duration(seconds: 120);
  dio.options.receiveTimeout = const Duration(seconds: 120);
  dio.options.headers['Content-Type'] = 'application/json';
  dio.options.headers['Accept'] = 'application/json';
  dio.options.validateStatus = (status) {
    return status == 200 || status == 401;
  };
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        TokenManager tokenManager =
            await ref.watch(tokenManagerProvider.future);
        final authToken = await tokenManager.getToken();
        options.headers['Authorization'] = 'Bearer $authToken';
        return handler.next(options);
      },
    ),
  );
  if (!kReleaseMode) {
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
    ));
  }
  return dio;
}
