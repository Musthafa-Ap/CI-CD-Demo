import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String name;
  final String age;
  const UserModel({required this.name, required this.age});
  @override
  List<Object?> get props => [name, age];
}
