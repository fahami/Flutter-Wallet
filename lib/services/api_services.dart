import 'dart:convert';
import 'package:beningswallet/data/repository.dart';
import 'package:beningswallet/models/balance.dart';
import 'package:beningswallet/models/mutation.dart';
import 'package:beningswallet/models/mutation_detail.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static final String _baseUrl = 'https://beningsindonesia.com/e-wallet/v1';

  Future<Balance> fetchBalance() async {
    final response = await http.get(Uri.parse('$_baseUrl/balance'));
    // Ketika menggunakan internet, gunakan cara dibawah
    // final data = jsonDecode(response.body);
    final data = jsonDecode(jsonEncode(walletBalance));
    return data['status'] == 'ok'
        ? Balance.fromJson(data)
        : throw Exception('Gagal memuat data saldo');
  }

  Future<Mutation> fetchMutation({int page = 1, int perPage = 10}) async {
    final response = await http
        .get(Uri.parse('$_baseUrl/wallet?page=$page&perPage=$perPage'));
    // Ketika menggunakan internet, gunakan cara dibawah
    // final data = jsonDecode(response.body);
    final data = jsonDecode(jsonEncode(mutation));
    return data['status'] == 'ok'
        ? Mutation.fromJson(data)
        : throw Exception('Gagal memuat data riwayat transaksi');
  }

  Future<MutationDetail> fetchMutationDetail(String id) async {
    final response = await http.get(Uri.parse('$_baseUrl/wallet/$id'));
    // Ketika menggunakan internet, gunakan cara dibawah
    // final data = jsonDecode(response.body);
    final data = jsonDecode(jsonEncode(mutationDetails));
    return data['status'] == 'ok'
        ? MutationDetail.fromJson(data)
        : throw Exception('Gagal memuat data detail transaksi');
  }

  Future<MutationDetail> topup(int amount, String information) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/wallet/in'),
      body: {
        "value": amount,
        "information": information,
      },
    );
    // Ketika menggunakan internet, gunakan cara dibawah
    // final data = jsonDecode(response.body);
    final data = jsonDecode(jsonEncode(topUpWallet));
    return data['status'] == 'ok'
        ? MutationDetail.fromJson(data)
        : throw Exception('Gagal melakukan topup');
  }

  Future<MutationDetail> transaction(int amount, String information) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/wallet/out'),
      body: {
        "value": amount,
        "information": information,
      },
    );
    // Ketika menggunakan internet, gunakan cara dibawah
    // final data = jsonDecode(response.body);
    final data = jsonDecode(jsonEncode(walletTransaction));
    return data['status'] == 'ok'
        ? MutationDetail.fromJson(data)
        : throw Exception('Gagal melakukan transaksi');
  }

  Future<bool> deleteTransaction(int id) async {
    final response = await http.patch(Uri.parse('$_baseUrl/wallet/$id'));
    // Ketika menggunakan internet, gunakan cara dibawah
    // final data = jsonDecode(response.body);
    final data = jsonDecode(jsonEncode(deleteTransaction));
    return data['status'] == 'ok' ? true : false;
  }
}
