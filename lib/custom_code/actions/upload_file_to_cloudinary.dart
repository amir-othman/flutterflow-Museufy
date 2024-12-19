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

import 'package:http/http.dart' as http; // Ensure http package is imported
import 'dart:convert';

Future<String?> uploadFileToCloudinary(
  BuildContext context,
  FFUploadedFile? file,
) async {
  // Add your function code here!

  // Cloudinary credentials
  final String cloudName = 'dockqbc5i'; // Replace with your actual cloud name
  final String apiKey = '329791328233327'; // Your API Key
  final String uploadPreset =
      'lq4gcwkj'; // Your Cloudinary unsigned upload preset

  if (file == null || file.bytes == null) {
    print('No image file provided.');
    return null;
  }

  try {
    // Convert the image bytes to base64
    String base64Image = base64Encode(file.bytes!);

    // Prepare the Cloudinary URL
    final String uploadUrl =
        'https://api.cloudinary.com/v1_1/$cloudName/image/upload';

    // Create and send the HTTP request
    final request = http.MultipartRequest('POST', Uri.parse(uploadUrl));
    request.fields['file'] =
        'data:image/jpeg;base64,$base64Image'; // Base64 data
    request.fields['upload_preset'] = uploadPreset; // Upload preset
    request.fields['api_key'] =
        apiKey; // API Key (optional for unsigned upload)

    final response = await request.send();
    final responseString = await response.stream.bytesToString();

    print('Response from Cloudinary: $responseString'); // Debugging

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(responseString);
      return jsonResponse['secure_url']; // Return the uploaded image URL
    } else {
      print('Failed to upload image. Status: ${response.statusCode}');
      print('Error: $responseString');
      return null;
    }
  } catch (error) {
    print('Error during upload: $error');
    return null;
  }
}
