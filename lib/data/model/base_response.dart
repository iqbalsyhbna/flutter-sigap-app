class ApiResponse<T> {
  bool success;
  String? message;
  dynamic data;

  ApiResponse({required this.success, this.message, this.data});

  factory ApiResponse.fromJson(Map<dynamic, dynamic> json) {
    return ApiResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"],
    );
  }
}