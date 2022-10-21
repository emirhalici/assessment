class ResponseModel<T extends Object> {
  ResponseModel({
    required this.status,
    this.statusCode,
    this.rawResponse,
    this.errorMessage,
    this.model,
  });
  final bool status;
  final int? statusCode;
  final Object? rawResponse;
  final String? errorMessage;
  final T? model;
}
