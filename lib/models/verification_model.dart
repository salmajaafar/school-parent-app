class VerifyModel {
   final bool success;
  final String message;

  VerifyModel({required this.success, required this.message});

  factory VerifyModel.fromjson(Map<String,dynamic>json){
    return VerifyModel(success: json["success"], message: json["message"]);

  }
}