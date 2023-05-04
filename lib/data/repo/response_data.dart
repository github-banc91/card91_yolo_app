import 'package:flutter/material.dart';

@immutable
class Response<T> {
  bool status;
  String message;
  T data;

  Response(this.status, this.message, this.data);

  factory Response.fromJson(Map<String, dynamic> json) {
    final s = json['status'] as bool;
    final m = json['message'] as String;
    final data = json['data'];
    return Response(s, m, data);
  }
}
