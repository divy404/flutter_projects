import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class CurrencyConvertorMaterialPage extends StatefulWidget {
  const CurrencyConvertorMaterialPage({super.key});

  @override
  State<CurrencyConvertorMaterialPage> createState() =>
      _CurrencyConvertorMaterialPageState();
}

class _CurrencyConvertorMaterialPageState
    extends State<CurrencyConvertorMaterialPage> {
  double result = 0;
  bool isLoading = false;
  String fromCurrency = "USD";
  String toCurrency = "INR";
  final TextEditingController textEditingController = TextEditingController();

  final String apiKey = "fca_live_4lU5vRL8tflyBpGugM3VeR6CnDZFv1rPqyb2hkSB";

  Future<void> convert() async {
    if (textEditingController.text.isEmpty) return;

    setState(() {
      isLoading = true;
    });

    try {
      double amount = double.parse(textEditingController.text);
      String apiUrl =
          "https://api.freecurrencyapi.com/v1/latest?apikey=$apiKey&base_currency=$fromCurrency&currencies=$toCurrency";

      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        double exchangeRate = data['data'][toCurrency];

        setState(() {
          result = amount * exchangeRate;
        });
      } else {
        setState(() {
          result = 0;
        });
        showError("Failed to fetch exchange rate.");
      }
    } catch (e) {
      setState(() {
        result = 0;
      });
      showError("Invalid input or API error.");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message, style: const TextStyle(color: Colors.white)), backgroundColor: Colors.red),
    );
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.black,
        width: 2.0,
        style: BorderStyle.solid,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(12)),
    );

    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        elevation: 2,
        title: const Text('Currency Converter', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Converted Amount: $toCurrency ${result.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Currency Selection Dropdowns
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton<String>(
                  value: fromCurrency,
                  items: ["USD", "EUR", "GBP", "JPY", "INR"]
                      .map((currency) => DropdownMenuItem(
                            value: currency,
                            child: Text(currency),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      fromCurrency = value!;
                    });
                  },
                ),
                const SizedBox(width: 20),
                const Icon(Icons.swap_horiz),
                const SizedBox(width: 20),
                DropdownButton<String>(
                  value: toCurrency,
                  items: ["USD", "EUR", "GBP", "JPY", "INR"]
                      .map((currency) => DropdownMenuItem(
                            value: currency,
                            child: Text(currency),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      toCurrency = value!;
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),
            TextField(
              controller: textEditingController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                hintText: 'Enter amount in $fromCurrency',
                filled: true,
                fillColor: Colors.white,
                focusedBorder: border,
                enabledBorder: border,
              ),
            ),
            const SizedBox(height: 20),

            isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: convert,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[700],
                      foregroundColor: Colors.white,
                      minimumSize: const Size(150, 50),
                    ),
                    child: const Text('Convert'),
                  ),
          ],
        ),
      ),
    );
  }
}
