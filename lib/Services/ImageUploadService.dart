import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ImageUploadService {
  final String _apiKey = '45dcb5a2ef516cd03befc93d0aed04d8';
  final String _uploadUrl = 'https://api.imgbb.com/1/upload';

  /// Uploads image to imgbb and returns the image URL
  Future<String> uploadImage(File imageFile) async {
    try {
      final bytes = await imageFile.readAsBytes();
      final base64Image = base64Encode(bytes);

      final response = await http.post(
        Uri.parse('$_uploadUrl?key=$_apiKey'),
        body: {'image': base64Image},
      );

      final jsonData = jsonDecode(response.body);

      if (response.statusCode == 200 && jsonData['success'] == true) {
        return jsonData['data']['url']; // ✅ Image URL
      } else {
        throw 'Upload failed: ${jsonData['error']['message']}';
      }
    } catch (e) {
      throw 'Error uploading image: $e';
    }
  }
}// TODO Implement this library.