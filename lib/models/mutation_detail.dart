import 'package:beningswallet/models/mutation_item.dart';
import 'package:equatable/equatable.dart';

class MutationDetail extends Equatable {
  final String? status;
  final String? messages;
  final MutationItem? item;

  const MutationDetail({this.status, this.messages, this.item});

  factory MutationDetail.fromJson(Map<String, dynamic> json) => MutationDetail(
        status: json['status'] as String?,
        messages: json['messages'] as String?,
        item: json['data'] == null
            ? null
            : MutationItem.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'messages': messages,
        'data': item?.toJson(),
      };

  @override
  List<Object?> get props => [status, messages, item];
}
