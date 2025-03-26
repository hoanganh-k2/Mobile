import 'package:flutter/material.dart';
import 'package:wallet/utils/localization.dart';

class LastScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate("discover")),
        centerTitle: true,
        backgroundColor: const Color(0xFF9886E5),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context).translate("search"),
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: _buildBox(
                        AppLocalizations.of(context).translate("sites"),
                        Icons.web,
                        const Color.fromARGB(255, 224, 88, 78),
                        height: double.infinity),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Expanded(
                            child: _buildBox(
                                AppLocalizations.of(context)
                                    .translate("tokens"),
                                Icons.monetization_on,
                                const Color.fromARGB(255, 171, 252, 80))),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                                child: _buildBox(
                                    AppLocalizations.of(context)
                                        .translate("collections"),
                                    Icons.category,
                                    const Color.fromARGB(255, 190, 55, 179))),
                            SizedBox(width: 16),
                            Expanded(
                                child: _buildBox(
                                    AppLocalizations.of(context)
                                        .translate("learn"),
                                    Icons.school,
                                    const Color.fromARGB(255, 17, 170, 241))),
                          ],
                        ),
                        SizedBox(height: 16),
                        Expanded(
                            child: _buildBox(
                                AppLocalizations.of(context).translate("quest"),
                                Icons.explore,
                                const Color.fromARGB(255, 252, 226, 82))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBox(String title, IconData icon, Color color, {double? height}) {
    return Container(
      height: height ?? 100,
      decoration: BoxDecoration(
        color: color.withAlpha(95),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 40, color: color),
            SizedBox(height: 8),
            Text(title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
