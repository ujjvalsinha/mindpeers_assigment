class CustomError extends Error {
  final String? code;
  final String? message;

  CustomError({this.code, this.message});

  @override
  String toString() => 'CustomError(message: $message)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CustomError && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

class NoInternetError extends CustomError {
  NoInternetError()
      : super(code: "NO_INTERNET", message: "Unable to connect to internet");
}
