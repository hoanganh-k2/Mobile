import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet/main.dart';
import 'package:wallet/providers/ethereum_provider.dart';
import 'package:wallet/utils/format.dart';
import 'package:wallet/screens/nav/_nav.dart';
import 'package:wallet/utils/localization.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late EthereumProvider ethereumProvider;
  int _currentIndex = 0;
  String network = 'Ethereum';

  final List<Widget> _pages = [
    HomeScreen(),
    CollectionScreen(),
    HistoryScreen(),
    LastScreen()
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ethereumProvider = Provider.of<EthereumProvider>(context);
  }

  @override
  void dispose() {
    super.dispose();
    ethereumProvider.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var address = ethereumProvider.walletModel!.getAddress;
    List<ListTile> wallets = [];
    for (var i = 0; i < ethereumProvider.wallets.length; i++) {
      bool isSelected =
          ethereumProvider.currentWalletIndex == i; // Kiểm tra ví hiện tại
      wallets.add(
        ListTile(
          leading: CircleAvatar(
            backgroundColor: isSelected
                ? Colors.orange
                : Colors.orange[100], // Tô màu nếu được chọn
            child: Icon(Icons.account_balance_wallet,
                color: isSelected ? Colors.white : Colors.orange),
          ),
          title: Text(
            'Ví ${i + 1}',
            style: TextStyle(
              fontWeight: isSelected
                  ? FontWeight.bold
                  : FontWeight.normal, // In đậm nếu được chọn
            ),
          ),
          subtitle: Text(AddressFormat.formatAddress(
              ethereumProvider.wallets[i].address ?? '0x123...789')),
          tileColor:
              isSelected ? Colors.orange[50] : null, // Tô màu nền nếu được chọn
          onTap: () {
            setState(() {
              ethereumProvider.switchWallet(i); // Cập nhật ví hiện tại
            });
            Navigator.pop(context); // Đóng modal
          },
        ),
      );
    }

    wallets.add(
      ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.green[100],
          child: Icon(Icons.add, color: Colors.green),
        ),
        title: Text(
          AppLocalizations.of(context).translate("add_wallet"),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        elevation: 0,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 280,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            children: [
                              ...wallets,
                              Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.edit, color: Colors.blue),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete, color: Colors.red),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.orange[100],
                    child: Text('B',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 153, 0, 255))),
                  ),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.translate("wallet"),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      AddressFormat.formatAddress(address),
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                DropdownButton<String>(
                  value: network,
                  items: ['Ethereum', 'Solana', 'Polygon'].map((String choice) {
                    return DropdownMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        network = newValue;
                      });
                    }
                  },
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.qr_code_scanner),
                  onPressed: () {},
                ),
                PopupMenuButton(
                  icon: Icon(Icons.settings),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Row(
                        children: [
                          Icon(Icons.language, color: Colors.green),
                          SizedBox(width: 8),
                          Text(AppLocalizations.of(context)
                              .translate("switch_language"))
                        ],
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                AppLocalizations.of(context)
                                    .translate("select_language"),
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    title: Text(
                                      AppLocalizations.of(context)
                                          .translate("english"),
                                    ),
                                    onTap: () {
                                      MyApp.setLocale(
                                          context, Locale('en', ''));

                                      setState(() {}); // Cập nhật lại UI
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    title: Text(
                                      AppLocalizations.of(context)
                                          .translate("vietnamese"),
                                    ),
                                    onTap: () {
                                      MyApp.setLocale(
                                          context, Locale('vi', ''));
                                      setState(() {}); // Cập nhật lại UI
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                    PopupMenuItem(
                      child: Row(
                        children: [
                          Icon(Icons.settings, color: Colors.blue),
                          SizedBox(width: 8),
                          Text(
                            AppLocalizations.of(context).translate("settings"),
                          ),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      child: Row(
                        children: [
                          Icon(Icons.logout, color: Colors.red),
                          SizedBox(width: 8),
                          Text(
                            AppLocalizations.of(context).translate("logout"),
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed('/');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 14,
        unselectedFontSize: 12,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: AppLocalizations.of(context).translate("home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: AppLocalizations.of(context).translate("collection"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: AppLocalizations.of(context).translate("history"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.network_check),
            label: AppLocalizations.of(context).translate("network"),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
