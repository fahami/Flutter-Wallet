import 'package:beningswallet/view_model/wallet_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../style.dart';

class ModalTopup extends StatelessWidget {
  ModalTopup({
    Key? key,
  }) : super(key: key);
  final formatCurrency = new NumberFormat.simpleCurrency(locale: 'id_ID');
  final formatDate = new DateFormat.yMMMd();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<WalletProvider>(context, listen: false);
    return Container(
      height: 400,
      padding: kScreenPadding,
      child: ListView(
        children: [
          Text(
            'Masukkan jumlah topup',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(
            height: 12,
          ),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            childAspectRatio: 2 / 1,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(kAccentColor)),
                  onPressed: () => print('50rb'),
                  child: Text(
                    formatCurrency.format(50000),
                    style: TextStyle(color: kSecondaryColor, fontSize: 16),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(kAccentColor)),
                  onPressed: () => print('100rb'),
                  child: Text(
                    formatCurrency.format(100000),
                    style: TextStyle(color: kSecondaryColor, fontSize: 16),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(kAccentColor)),
                  onPressed: () => print('150rb'),
                  child: Text(
                    formatCurrency.format(150000),
                    style: TextStyle(color: kSecondaryColor, fontSize: 16),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(kAccentColor)),
                  onPressed: () => print('200rb'),
                  child: Text(
                    formatCurrency.format(200000),
                    style: TextStyle(color: kSecondaryColor, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
          TextField(decoration: InputDecoration(labelText: 'Catatan')),
          SizedBox(width: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Batal'),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: () =>
                    provider.transactionWallet(5000, 'information'),
                child: Text('Bayar'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
