import 'package:beningswallet/view_model/wallet_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../style.dart';

class ModalMutationDetail extends StatelessWidget {
  final String id;
  ModalMutationDetail({
    Key? key,
    required this.id,
  }) : super(key: key);
  final formatCurrency = new NumberFormat.simpleCurrency(locale: 'id_ID');
  final formatDate = new DateFormat.yMMMd();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<WalletProvider>(context, listen: false);
    return Container(
      height: 150,
      padding: kScreenPadding,
      child: FutureBuilder(
        future: provider.fetchMutationDetail(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Informasi Detail Transaksi'),
                  Text(
                    'oleh: ' +
                        provider.mutationDetail.item!.userCreated!
                            .toUpperCase(),
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              ListTile(
                leading: Icon(
                  provider.mutationDetail.item!.type == "out"
                      ? Icons.arrow_circle_down_outlined
                      : Icons.arrow_circle_up_rounded,
                  color: provider.mutationDetail.item!.type == "out"
                      ? Colors.red
                      : Colors.green,
                ),
                title: Text(
                  provider.mutationDetail.item!.information!.toUpperCase(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: kAccentColor),
                ),
                subtitle: Text(
                  formatDate.format(
                    DateTime.parse(provider.mutationDetail.item!.date!),
                  ),
                ),
                trailing: Text(
                  formatCurrency.format(provider.mutationDetail.item!.value!),
                  style: TextStyle(fontSize: 16),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
