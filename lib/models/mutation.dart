import 'package:equatable/equatable.dart';

import 'data.dart';

class Mutation extends Equatable {
	final String? status;
	final String? messages;
	final Data? data;

	const Mutation({this.status, this.messages, this.data});

	factory Mutation.fromJson(Map<String, dynamic> json) => Mutation(
				status: json['status'] as String?,
				messages: json['messages'] as String?,
				data: json['data'] == null
						? null
						: Data.fromJson(json['data'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'status': status,
				'messages': messages,
				'data': data?.toJson(),
			};

	@override
	List<Object?> get props => [status, messages, data];
}
