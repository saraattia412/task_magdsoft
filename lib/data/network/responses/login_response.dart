class ResponsesModel {
  int? status;
    String? message;
   int? code;


//named constructor
  ResponsesModel.fromJson(Map<String, dynamic> json) {
    status = json[status];
    message = json['message'];
    code =json[code];
  }
}


