import 'dart:developer';

import 'package:beningswallet/constant.dart';
import 'package:beningswallet/models/balance.dart';
import 'package:beningswallet/models/mutation.dart';
import 'package:beningswallet/models/mutation_detail.dart';
import 'package:beningswallet/services/api_services.dart';
import 'package:flutter/foundation.dart';

class WalletProvider with ChangeNotifier {
  ApiService apiService = ApiService();

  late ResultState _state;
  ResultState get state => _state;

  late Mutation _mutation;
  Mutation get mutation => _mutation;

  late MutationDetail _topup;
  MutationDetail get topup => _topup;

  late MutationDetail _transaction;
  MutationDetail get transaction => _transaction;

  late Balance _balance;
  Balance get balance => _balance;

  late MutationDetail _mutationDetail;
  MutationDetail get mutationDetail => _mutationDetail;

  Future<void> fetchMutation() async {
    _state = ResultState.LOADING;
    var listOfMutation = await apiService.fetchMutation();
    inspect(listOfMutation);
    if (listOfMutation.data!.items!.length > 0) {
      _state = ResultState.HAS_DATA;
      _mutation = listOfMutation;
    }
    _state = ResultState.NO_DATA;
    notifyListeners();
  }

  Future<void> fetchMutationDetail(String id) async {
    _state = ResultState.LOADING;
    var singleMutation = await apiService.fetchMutationDetail(id);
    inspect(singleMutation);
    if (singleMutation != null) {
      _state = ResultState.HAS_DATA;
      _mutationDetail = singleMutation;
    }
    _state = ResultState.NO_DATA;
    notifyListeners();
  }

  Future<void> topupBalance(int amount, String information) async {
    _state = ResultState.LOADING;
    var topup = await apiService.topup(amount, information);
    inspect(topup);
    if (topup != null) {
      _state = ResultState.HAS_DATA;
      _topup = topup;
    }
    _state = ResultState.NO_DATA;
    notifyListeners();
  }

  Future<void> transactionWallet(int amount, String information) async {
    _state = ResultState.LOADING;
    var transac = await apiService.transaction(amount, information);
    inspect(transac);
    if (transac != null) {
      _state = ResultState.HAS_DATA;
      _topup = transac;
    }
    _state = ResultState.NO_DATA;
    notifyListeners();
  }

  Future<void> checkBalance() async {
    _state = ResultState.LOADING;
    var balances = await apiService.fetchBalance();
    inspect(balances);
    if (balances != null) {
      _state = ResultState.HAS_DATA;
      _balance = balances;
    }
    _state = ResultState.NO_DATA;
    notifyListeners();
  }

  Future<void> deleteTransaction(int id) async {
    _state = ResultState.LOADING;
    var delete = await apiService.deleteTransaction(id);
    inspect(delete);
    if (delete != null) {
      _state = ResultState.DONE;
    }
    notifyListeners();
  }
}
