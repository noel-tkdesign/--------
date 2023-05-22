import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  String isSelectedValue = 'サウンド１';
  String isSelectedAnimation = 'アニメ1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('設定'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('サウンド'),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 150,
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'サウンド１',
                    child: Text('サウンド１'),
                  ),
                  DropdownMenuItem(
                    value: 'サウンド２',
                    child: Text('サウンド２'),
                  ),
                ],
                value: isSelectedValue,
                onChanged: (String? value) {
                  setState(() {
                    isSelectedValue = value!;
                  });
                },
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text('アニメーション'),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 150,
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'アニメ1',
                    child: Text('アニメ1'),
                  ),
                  DropdownMenuItem(
                    value: 'アニメ2',
                    child: Text('アニメ2'),
                  ),
                ],
                value: isSelectedAnimation,
                onChanged: (String? value) {
                  setState(() {
                    isSelectedAnimation = value!;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
