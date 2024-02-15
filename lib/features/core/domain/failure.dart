import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';
part 'failure.g.dart';

@freezed
class Failure with _$Failure {
  const factory Failure({
    required String code,
    required String message,
  }) = _Failure;

  factory Failure.fromJson(Map<String, dynamic> json) =>
      _$FailureFromJson(json);

  factory Failure.none() => const _Failure(
        code: '',
        message: '',
      );

  factory Failure.general() => const _Failure(
        code: 'general',
        message:
            'An error occurred. Please try again later.  Contact support if the problem persists.',
      );
}
