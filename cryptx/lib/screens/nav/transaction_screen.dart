import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet/providers/ethereum_provider.dart';
import 'package:wallet/utils/format.dart';
import 'package:wallet/utils/localization.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryScreen extends StatefulWidget {
  @override
  State<HistoryScreen> createState() => HistoryScreenState();
}

class HistoryScreenState extends State<HistoryScreen> {
  late EthereumProvider ethereumProvider;
  final List<Map<String, dynamic>> transactions = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ethereumProvider = Provider.of<EthereumProvider>(context, listen: false);
    loadTransactions();
  }

  Future<void> loadTransactions() async {
    if (!mounted) return;

    await ethereumProvider.loadTransactions();
    transactions.clear();

    final String sendText = AppLocalizations.of(context)!.translate("send");
    final String receiveText =
        AppLocalizations.of(context)!.translate("receive");
    final String successText =
        AppLocalizations.of(context)!.translate("success");

    for (var transaction in ethereumProvider.transactions) {
      transactions.add({
        "type": transaction.to!.getAddress.toLowerCase() ==
                ethereumProvider.walletModel!.getAddress.toLowerCase()
            ? receiveText
            : sendText,
        "amount": transaction.amount,
        "address": AddressFormat.formatAddress(transaction.to!.getAddress),
        "date": transaction.date,
        "status": successText,
      });
    }

    transactions.sort((a, b) => b["date"].compareTo(a["date"]));

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final String transactionHistoryText =
        AppLocalizations.of(context)!.translate(
      "Transaction History",
    );
    final String addressText =
        AppLocalizations.of(context)!.translate("address");
    final String dateText = AppLocalizations.of(context)!.translate("date");
    final String sendText = AppLocalizations.of(context)!.translate("send");
    final String receiveText =
        AppLocalizations.of(context)!.translate("receive");
    final String successText =
        AppLocalizations.of(context)!.translate("success");

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(transactionHistoryText,
            style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color(0xFF9886E5),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: transactions.length,
          separatorBuilder: (context, index) => Divider(),
          itemBuilder: (context, index) {
            final transaction = transactions[index];
            final bool isSend = transaction["type"] == sendText;

            return ListTile(
              leading: CircleAvatar(
                backgroundColor:
                    isSend ? Colors.red[100] : Colors.green[100],
                child: Icon(
                  isSend ? Icons.arrow_upward : Icons.arrow_downward,
                  color: isSend ? Colors.red : Colors.green,
                ),
              ),
              title: Text(
                "${transaction["type"]} ${transaction["amount"]} ETH",
                style: TextStyle(fontWeight: FontWeight.bold,color:Colors.white),
              ),
              subtitle: Text(
                "$addressText: ${transaction["address"]}\n$dateText: ${transaction["date"]}",
                style: TextStyle(color: Colors.grey),
              ),
              trailing: Text(
                transaction["status"],
                style: TextStyle(
                  color: transaction["status"] == successText
                      ? Colors.green
                      : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                // Xử lý khi nhấn vào giao dịch (nếu cần)
              },
            );
          },
        ),
      ),
    );
  }
}
