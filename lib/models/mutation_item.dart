import 'package:equatable/equatable.dart';

class MutationItem extends Equatable {
  final String? id;
  final String? date;
  final String? type;
  final int? value;
  final String? information;
  final String? createdAt;
  final String? userCreated;
  final String? updatedAt;
  final String? userUpdated;

  const MutationItem({
    this.id,
    this.date,
    this.type,
    this.value,
    this.information,
    this.createdAt,
    this.userCreated,
    this.updatedAt,
    this.userUpdated,
  });

  factory MutationItem.fromJson(Map<String, dynamic> json) => MutationItem(
        id: json['id'] as String?,
        date: json['date'] as String?,
        type: json['type'] as String?,
        value: json['value'] as int?,
        information: json['information'] as String?,
        createdAt: json['created_at'] as String?,
        userCreated: json['user_created'] as String?,
        updatedAt: json['updated_at'] as String?,
        userUpdated: json['user_updated'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'date': date,
        'type': type,
        'value': value,
        'information': information,
        'created_at': createdAt,
        'user_created': userCreated,
        'updated_at': updatedAt,
        'user_updated': userUpdated,
      };

  @override
  List<Object?> get props => [
        id,
        date,
        type,
        value,
        information,
        createdAt,
        userCreated,
        updatedAt,
        userUpdated,
      ];
}
