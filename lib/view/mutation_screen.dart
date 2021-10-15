import 'package:beningswallet/style.dart';
import 'package:flutter/material.dart';

class MutationScreen extends StatelessWidget {
  const MutationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: kScreenPadding,
        children: [
          Text('Riwayat Transaksi'),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.arrow_circle_up_rounded),
                title: Text("topup benings pay"),
                subtitle: Text("2021-10-12"),
                trailing: Text('100000'),
              );
            },
          ),
        ],
      ),
    );
  }
}
