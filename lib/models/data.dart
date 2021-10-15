import 'package:equatable/equatable.dart';

import 'mutation_item.dart';

class Data extends Equatable {
  final List<MutationItem>? items;
  final int? page;
  final int? perPage;

  const Data({this.items, this.page, this.perPage});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        items: (json['items'] as List<dynamic>?)
            ?.map((e) => MutationItem.fromJson(e as Map<String, dynamic>))
            .toList(),
        page: json['page'] as int?,
        perPage: json['perPage'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'items': items?.map((e) => e.toJson()).toList(),
        'page': page,
        'perPage': perPage,
      };

  @override
  List<Object?> get props => [items, page, perPage];
}
