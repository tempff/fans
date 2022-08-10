class ForgotPasswordModel {
  ForgotPasswordModel({
      String? message,}){
    _message = message;
}

  ForgotPasswordModel.fromJson(dynamic json) {
    _message = json['message'];
  }
  String? _message;
ForgotPasswordModel copyWith({  String? message,
}) => ForgotPasswordModel(  message: message ?? _message,
);
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    return map;
  }

}