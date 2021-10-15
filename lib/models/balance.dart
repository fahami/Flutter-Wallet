import 'package:equatable/equatable.dart';

class Balance extends Equatable {
	final String? status;
	final String? messages;
	final int? myBalance;

	const Balance({this.status, this.messages, this.myBalance});

	factory Balance.fromJson(Map<String, dynamic> json) => Balance(
				status: json['status'] as String?,
				messages: json['messages'] as String?,
				myBalance: json['myBalance'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'status': status,
				'messages': messages,
				'myBalance': myBalance,
			};

	@override
	List<Object?> get props => [status, messages, myBalance];
}
