import 'package:equatable/equatable.dart';

class ErrorsModel extends Equatable {
  final bool success;
  final int statusCode;
  final String statusMessage;

  const ErrorsModel({
    required this.success,
    required this.statusCode,
    required this.statusMessage});

  factory ErrorsModel.fromJson(Map<String, dynamic> json) {
    return ErrorsModel(success : json['success'],
        statusCode : json['status_code'],
        statusMessage : json['status_message']);
  }

  @override
  List<Object?> get props => [success,statusCode,statusMessage];


}