import 'package:flutter/material.dart';

class SwapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Swap tiền mã hóa",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: const Color(0xFF9886E5),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Từ loại tiền",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
            ),
            SizedBox(height: 8),
            DropdownButtonFormField(
              items: [
                DropdownMenuItem(value: "ETH", child: Text("ETH",style: TextStyle(color: Colors.white))),
                DropdownMenuItem(value: "USDT", child: Text("USDT",style: TextStyle(color: Colors.white))),
                DropdownMenuItem(value: "BTC", child: Text("BTC",style: TextStyle(color: Colors.white))),
              ],
              onChanged: (value) {},
               dropdownColor: const Color.fromRGBO(38, 38, 38, 1.0),
              decoration: InputDecoration(
                hintText: "Chọn loại tiền",
                hintStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                ),
                 // Cách thay hintText
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Sang loại tiền",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
            ),
            SizedBox(height: 8),
            DropdownButtonFormField(
              items: [
                DropdownMenuItem(value: "ETH", child: Text("ETH",style: TextStyle(color: Colors.white))),
                DropdownMenuItem(value: "USDT", child: Text("USDT",style: TextStyle(color: Colors.white))),
                DropdownMenuItem(value: "BTC", child: Text("BTC",style: TextStyle(color: Colors.white))),
              ],
              onChanged: (value) {},
              dropdownColor: const Color.fromRGBO(38, 38, 38, 1.0),
              style: TextStyle(color: Colors.white), // Màu chữ của item được chọn // Màu nền của dropdown
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: "Chọn loại tiền",
                
              ),
            ),
            SizedBox(height: 16),
            TextField(
              style: TextStyle(color: Colors.white),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.white60),
                hintText: "Nhập số lượng cần swap",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                backgroundColor: const Color(0xFF9886E5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Center(
                child: Text(
                  "Swap ngay",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Sw extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Swap tiền mã hóa"),
        centerTitle: true,
        backgroundColor: const Color(0xFF9886E5),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Từ loại tiền",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            DropdownButtonFormField(
              items: [
                DropdownMenuItem(value: "ETH", child: Text("ETH")),
                DropdownMenuItem(value: "USDT", child: Text("USDT")),
                DropdownMenuItem(value: "BTC", child: Text("BTC")),
              ],
              onChanged: (value) {
                // Xử lý chọn loại tiền
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText: "Chọn loại tiền",
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Sang loại tiền",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            DropdownButtonFormField(
              items: [
                DropdownMenuItem(value: "ETH", child: Text("ETH")),
                DropdownMenuItem(value: "USDT", child: Text("USDT")),
                DropdownMenuItem(value: "BTC", child: Text("BTC")),
              ],
              onChanged: (value) {
                // Xử lý chọn loại tiền
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText: "Chọn loại tiền",
              ),
            ),
            SizedBox(height: 16),
            TextField(
              style: TextStyle(color: Colors.white),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.white60),
                hintText: "Nhập số lượng cần swap",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Xử lý swap
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                backgroundColor: const Color(0xFF9886E5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Center(
                child: Text(
                  "Swap ngay",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
