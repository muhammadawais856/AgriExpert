import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

class ImageApiService {
  final String uploadUrl = '{{localUrl}}/api/images/upload'; // Replace with your actual upload endpoint
  final String getImagesUrl = '{{localUrl}}/api/images/get-images'; // Replace with your actual get endpoint

  /// Upload image and return image URL
  Future<String?> uploadImage(File imageFile) async {
    try {
      final mimeType = lookupMimeType(imageFile.path)?.split('/');
      var request = http.MultipartRequest('POST', Uri.parse(uploadUrl))
        ..files.add(await http.MultipartFile.fromPath(
          'image', // Replace with expected field name
          imageFile.path,
          contentType: mimeType != null ? MediaType(mimeType[0], mimeType[1]) : null,
        ));

      var response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final jsonData = jsonDecode(responseBody);
        return jsonData['imageUrl']; // Adjust based on API response structure
      } else {
        print("Upload failed: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Upload exception: $e");
      return null;
    }
  }

  /// Get all uploaded image URLs
  Future<List<String>> getImages() async {
    try {
      final response = await http.get(Uri.parse(getImagesUrl));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((item) => item['imageUrl'].toString()).toList();
      } else {
        print("Get images failed: ${response.statusCode}");
        return [];
      }
    } catch (e) {
      print("Get images exception: $e");
      return [];
    }
  }
}
