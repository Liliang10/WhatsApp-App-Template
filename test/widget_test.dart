import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_widget/main.dart';

void main() {
  testWidgets('App starts and shows WhatsUp title', (WidgetTester tester) async {
    // Build aplikasi
    await tester.pumpWidget(const WhatsAppClone());

    // Periksa apakah teks "WhatsUp" ada di AppBar
    expect(find.text('WhatsUp'), findsOneWidget);

    // Periksa apakah ada bottom navigation bar item "Chat"
    expect(find.text('Chat'), findsOneWidget);

    // Pastikan tombol tambah chat (FloatingActionButton) muncul
    expect(find.byIcon(Icons.chat), findsOneWidget);
  });
}
