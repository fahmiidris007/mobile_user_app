import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class AddUser extends Equatable{
  final String? name;
  final String? job;
  final String? id;
  final String? createdAt;
  final String? updatedAt;

  const AddUser({this.name, this.job, this.id, this.createdAt, this.updatedAt});

  factory AddUser.fromJson(Map<String, dynamic> json) {
    return AddUser(
      name : json['name'],
      job : json['job'],
      id : json['id'],
      createdAt :json['createdAt'],
      updatedAt :json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'job': job,
      'id': id,
      'createdAt':createdAt,
      'updatedAt': updatedAt,
    };
  }

  @override
  List<Object?> get props => [name, job, id, createdAt, updatedAt];
}