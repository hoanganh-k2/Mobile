import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wallet/providers/ethereum_provider.dart';
import 'package:wallet/screens/nav/_nav.dart';
import 'package:wallet/utils/localization.dart';
import 'package:wallet/widgets/token_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late EthereumProvider ethereumProvider;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ethereumProvider.fetchBalance();
      ethereumProvider.fetchPriceChange();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ethereumProvider = Provider.of<EthereumProvider>(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: const Color.fromRGBO(48, 48, 48, 1.0),
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              ethereumProvider.isLoading
                  ? CircularProgressIndicator()
                  : ethereumProvider.walletModel?.getBalance != null
                      ? Text(
                          '\$${ethereumProvider.walletModel?.getBalance.toStringAsFixed(2)}',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold,
                              color: Colors.white, )
                        )
                      : Text('NaN'),
              SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ethereumProvider.balanceChange?.toStringAsFixed(2) ?? "NaN",
                    style: TextStyle(
                      fontSize: 16,
                       color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    '(${ethereumProvider.priceChange?.toStringAsFixed(2) ?? "NaN"}%)',
                    style: TextStyle(
                      fontSize: 16,
                      color: ethereumProvider.priceChange! > 0
                          ? const Color.fromARGB(255, 0, 200, 0)
                          : const Color.fromARGB(255, 200, 0, 0),
                      backgroundColor: const Color.fromARGB(255, 215, 215, 215),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Nút Nhận
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ReceiveScreen()),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 42, 42, 42),
                            shape: BoxShape.circle,
                          ),
                          padding:
                              EdgeInsets.all(12), // Kích thước padding cân bằng
                          child: Icon(
                            Icons.arrow_downward,
                            color: const Color(0xFF9886E5),
                            size: 24, // Kích thước icon nhỏ hơn
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        AppLocalizations.of(context)!.translate("receive"),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  // Nút Gửi
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SendScreen()),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                             color: const Color.fromARGB(255, 42, 42, 42),
                            shape: BoxShape.circle,
                          ),
                          padding: EdgeInsets.all(12),
                          child: Icon(
                            Icons.arrow_upward,
                            color:const Color(0xFF9886E5),
                            size: 24,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        AppLocalizations.of(context)!.translate("send"),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                           color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  // Nút Đổi
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SwapScreen()),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 42, 42, 42),
                            shape: BoxShape.circle,
                          ),
                          padding: EdgeInsets.all(12),
                          child: Icon(
                            Icons.swap_horiz,
                            color: const Color(0xFF9886E5),
                            size: 24,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        AppLocalizations.of(context)!.translate("exchange"),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  // Nút Mua
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BuyAndSellScreen()),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color:  const Color.fromARGB(255, 42, 42, 42),
                            shape: BoxShape.circle,
                          ),
                          padding: EdgeInsets.all(12),
                          child: Icon(
                            Icons.shopping_cart,
                            color: const Color(0xFF9886E5),
                            size: 24,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        AppLocalizations.of(context)!.translate("buy"),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                           color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 12),
        Expanded(
          child: ListView(
            padding: EdgeInsets.all(16.0),
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 42, 42, 42),
                  // // Màu nền của khung
                   
            //  color :Color.fromRGBO(38, 38, 38, 1.0), 
                  borderRadius: BorderRadius.circular(8), // Bo góc
                ),
                padding: EdgeInsets.all(8.0), // Khoảng cách bên trong khung
                child: ListTile(
                  leading: Image.network(
                    "https://cryptologos.cc/logos/ethereum-eth-logo.png",
                    width: 40,
                    height: 40,
                    errorBuilder: (context, error, stackTrace) =>
                        Icon(Icons.error, color: Colors.red),
                  ),
                  title: Text(
                    "Ethereum",
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                  subtitle: Text(
                    "Balance: ${ethereumProvider.walletModel?.getEtherAmount ?? "0.0"} ETH",style: TextStyle(color: Colors.white),
                  ),
                  trailing: Text(
                    "\$${ethereumProvider.walletModel?.getBalance.toStringAsFixed(2) ?? "0.00"}",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
