import 'package:flutter/material.dart';

@immutable
class Response<T> {
  int status;
  // String message;
  T data;

  Response(this.status, this.data);

  factory Response.fromJson(Map<String, dynamic> json) {
    final s = json['status'] as int;
    // final m = json['message'] as String;
    final data = json['data'];
    return Response(s, data);
  }
}
