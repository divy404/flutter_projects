
import 'package:flutter/material.dart';
import './pages/currency_convertor_material_page.dart'; // relative importing

void main () {
  runApp(const MyApp());
}
// Types of widgets
// 1. StatelessWidget
// 2. StatefullWidget

// Material design
// Cupertino design 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return  MaterialApp(
      home: CurrencyConvertorMaterialPage(), 

    );
    
  }
}