import 'package:beningswallet/models/mutation.dart';
import 'package:beningswallet/style.dart';
import 'package:beningswallet/view/components/topup_sheet.dart';
import 'package:beningswallet/view_model/wallet_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'components/detail_sheet.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final formatCurrency = new NumberFormat.simpleCurrency(locale: 'id_ID');
  final formatDate = new DateFormat.yMMMd();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<WalletProvider>(context, listen: false);
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: ListView(
          padding: kScreenPadding,
          children: [
            Text(
              'Benings Indonesia ',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            FutureBuilder(
                future: provider.checkBalance(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Container(
                      height: 200,
                      padding: EdgeInsets.all(16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kAccentColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.account_balance_wallet_rounded),
                              ElevatedButton.icon(
                                onPressed: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) => ModalTopup());
                                },
                                icon: Icon(Icons.wallet_giftcard),
                                label: Text('TOPUP'),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Saldo Utama',
                                style: appTheme(context).textTheme.headline2,
                              ),
                              Text(
                                formatCurrency
                                    .format(provider.balance.myBalance),
                                style: appTheme(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(color: kSecondaryColor),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  }
                  return Text('Tidak dapat mendapatkan data');
                }),
            SizedBox(height: 15),
            Text(
              'Riwayat transaksi',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            FutureBuilder(
              future: provider.fetchMutation(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: provider.mutation.data!.items!.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(
                            provider.mutation.data!.items![index].type == "out"
                                ? Icons.arrow_circle_down_outlined
                                : Icons.arrow_circle_up_rounded,
                            color: provider.mutation.data!.items![index].type ==
                                    "out"
                                ? Colors.red
                                : Colors.green),
                        title: Text(
                          provider.mutation.data!.items![index].information!
                              .toUpperCase(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: kAccentColor),
                        ),
                        subtitle: Text(formatDate.format(DateTime.parse(
                            provider.mutation.data!.items![index].date!))),
                        trailing: Text(
                          formatCurrency.format(
                              provider.mutation.data!.items![index].value!),
                          style: TextStyle(fontSize: 16),
                        ),
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return ModalMutationDetail(
                                id: provider.mutation.data!.items![index].id!,
                              );
                            },
                          );
                        },
                      );
                    },
                  );
                }
                return Text('Gagal memuat daftar transaksi');
              },
            ),
          ],
        ),
      ),
    );
  }
}
