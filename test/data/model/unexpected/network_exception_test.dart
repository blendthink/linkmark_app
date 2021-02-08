import 'dart:io';
import 'dart:isolate';

import 'package:linkmark_app/data/model/exception/unexpected/network_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('NetworkException type Test', () async {
    expect(
        NetworkException(
          dioError: DioError(type: DioErrorType.CONNECT_TIMEOUT),
        ).type,
        equals(NetworkExceptionType.timeout));

    expect(
        NetworkException(
          dioError: DioError(type: DioErrorType.RECEIVE_TIMEOUT),
        ).type,
        equals(NetworkExceptionType.timeout));

    expect(
        NetworkException(
          dioError: DioError(type: DioErrorType.SEND_TIMEOUT),
        ).type,
        equals(NetworkExceptionType.network));

    expect(
        NetworkException(
          dioError: DioError(
              type: DioErrorType.RESPONSE, response: Response(statusCode: 400)),
        ).type,
        equals(NetworkExceptionType.badRequest));

    expect(
        NetworkException(
          dioError: DioError(
              type: DioErrorType.RESPONSE, response: Response(statusCode: 401)),
        ).type,
        equals(NetworkExceptionType.unauthorized));

    expect(
        NetworkException(
          dioError: DioError(
              type: DioErrorType.RESPONSE, response: Response(statusCode: 500)),
        ).type,
        equals(NetworkExceptionType.server));

    expect(
        NetworkException(
          dioError: DioError(
              type: DioErrorType.RESPONSE, response: Response(statusCode: 502)),
        ).type,
        equals(NetworkExceptionType.server));

    expect(
        NetworkException(
          dioError: DioError(
              type: DioErrorType.RESPONSE, response: Response(statusCode: 503)),
        ).type,
        equals(NetworkExceptionType.server));

    expect(
        NetworkException(
          dioError: DioError(
              type: DioErrorType.RESPONSE, response: Response(statusCode: 504)),
        ).type,
        equals(NetworkExceptionType.server));

    expect(
        NetworkException(
          dioError: DioError(type: DioErrorType.CANCEL),
        ).type,
        equals(NetworkExceptionType.cancel));

    expect(
        NetworkException(
          dioError: DioError(
              error: const SocketException('Failed host lookup: linkmark.dev'),
              type: DioErrorType.DEFAULT),
        ).type,
        equals(NetworkExceptionType.network));

    expect(
        NetworkException(
          dioError: DioError(type: DioErrorType.DEFAULT),
        ).type,
        equals(NetworkExceptionType.unknown));
  });

  test('NetworkException message Test', () async {
    final errorMessage = 'Failed host lookup: linkmark.dev';
    final exception = SocketException(errorMessage);

    final dioError = DioError(
      error: exception,
      type: DioErrorType.DEFAULT,
    );

    final expectMessage = '${exception.runtimeType.toString()}: $errorMessage';

    expect(
        NetworkException(
          dioError: dioError,
        ).message,
        expectMessage);
  });

  group('NetworkException toString Test', () {
    test('DioErrorType.CONNECT_TIMEOUT', () async {
      final expectMessage = 'NetworkException [NetworkExceptionType.timeout]: ';

      expect(
          NetworkException(
            dioError: DioError(type: DioErrorType.CONNECT_TIMEOUT),
          ).toString(),
          expectMessage);
    });

    test('RemoteError', () async {
      final error = RemoteError('description', 'stackDescription');
      final expectMessage =
          '''NetworkException [NetworkExceptionType.unknown]: ${error.toString()}\n${error.stackTrace}''';
      expect(
          NetworkException(
            dioError: DioError(error: error),
          ).toString(),
          expectMessage);
    });

    test('SocketException', () async {
      final errorMessage = 'Failed host lookup: linkmark.dev';
      final exception = SocketException(errorMessage);

      final dioError = DioError(
        error: exception,
        type: DioErrorType.DEFAULT,
      );

      final expectMessage =
          '''NetworkException [NetworkExceptionType.network]: ${exception.runtimeType.toString()}: $errorMessage''';

      expect(
          NetworkException(
            dioError: dioError,
          ).toString(),
          expectMessage);
    });
  });
}
