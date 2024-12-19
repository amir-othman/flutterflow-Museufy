// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:http/http.dart' as http;
import 'dart:convert';

Future<bool?> stripe(
  BuildContext context,
  String? cardNumber,
  String? cvv,
  String? email,
  String? amount,
  String? month,
  String? year,
) async {
  // Add your function code here!
  // Add your function code here!
  try {
    // Stripe API keys
    const String publicKey =
        'pk_test_51QXKyeCrl8OM8mhyoiUXYhnfStIqgSnURrXquKPb4Aeo3Qn11ajo1pQ7NtDnRsKOJYdIbyC1hjnX8kTzpIWafqlM00WBK8A57P';
    const String secretKey =
        'sk_test_51QXKyeCrl8OM8mhygU3u942yMYJpDNwPHi8RqufTq5jROgJRHHe10XsqdPjZ1dT95Jc4AtQpULObZoRAMG5CXJ7l00vVk5ZpRI';

    // Validate inputs
    if (cardNumber == null || cardNumber.isEmpty) {
      throw Exception("Card number is required.");
    }
    if (cvv == null || cvv.isEmpty) {
      throw Exception("CVV is required.");
    }
    if (email == null || email.isEmpty) {
      throw Exception("Email is required.");
    }
    if (amount == null || double.tryParse(amount) == null) {
      throw Exception("Valid amount is required.");
    }
    if (month == null ||
        month.isEmpty ||
        int.tryParse(month) == null ||
        int.parse(month) < 1 ||
        int.parse(month) > 12) {
      throw Exception("Valid expiration month is required.");
    }
    if (year == null ||
        year.isEmpty ||
        int.tryParse(year) == null ||
        year.length != 4) {
      throw Exception("Valid expiration year is required in 4-digit format.");
    }

    // Step 1: Create a token
    final tokenResponse = await http.post(
      Uri.parse('https://api.stripe.com/v1/tokens'),
      headers: {
        'Authorization': 'Bearer $publicKey',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'card[number]': cardNumber,
        'card[exp_month]': month,
        'card[exp_year]': year,
        'card[cvc]': cvv,
      },
    );

    if (tokenResponse.statusCode != 200) {
      throw Exception("Failed to create token: ${tokenResponse.body}");
    }

    final tokenData = json.decode(tokenResponse.body);
    final tokenId = tokenData['id'];

    // Step 2: Charge the card
    final chargeResponse = await http.post(
      Uri.parse('https://api.stripe.com/v1/charges'),
      headers: {
        'Authorization': 'Bearer $secretKey',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'amount':
            (double.parse(amount) * 100).toStringAsFixed(0), // Convert to cents
        'currency': 'usd',
        'source': tokenId,
        'receipt_email': email,
        'description': 'FlutterFlow Payment',
      },
    );

    if (chargeResponse.statusCode != 200) {
      throw Exception("Failed to charge card: ${chargeResponse.body}");
    }

    final chargeData = json.decode(chargeResponse.body);
    final isSuccess = chargeData['status'] == 'succeeded';

    return isSuccess;
  } catch (e) {
    print("Stripe Payment Error: $e");
    return false;
  }
}
