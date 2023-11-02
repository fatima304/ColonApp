import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class UploadFile extends StatefulWidget {
  @override
  _UploadFileState createState() => _UploadFileState();
}

class _UploadFileState extends State<UploadFile> {
  File? _selectedFile;
  double? percentageIdentity;
  String _fileName = '';
  bool _isFileUploaded = false;
  bool _isProcessing = false;
  String _errorMessage = '';

  Future<void> _uploadFile() async {
    // Open the file picker to select a file
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      String fileName = result.files.single.name;

      setState(() {
        _selectedFile = file;
        _fileName = fileName;
        _isFileUploaded = true; // Set the flag to indicate file upload
      });
    } else {
      // User canceled the file picker
      // Handle this case if needed
    }
  }

  Future<void> _processFile() async {
    if (_selectedFile != null) {
      setState(() {
        _isProcessing = true;
        _errorMessage = '';
      });

      try {
        // Create a multipart request
        var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              'http://10.0.2.2:5000/blast'), // Update with the correct URL for your Flask server
        );

        // Attach the file to the request
        request.files.add(
          await http.MultipartFile.fromPath(
            'file',
            _selectedFile!.path,
          ),
        );

        // Send the request and wait for the response
        var response = await request.send();

        if (response.statusCode == 200) {
          // Parse the response JSON
          var responseJson = await response.stream.bytesToString();
          var responseData = jsonDecode(responseJson);

          setState(() {
            percentageIdentity = responseData['percentage_identity'];
          });
        } else {
          // Error occurred during the request
          // Handle this case if needed
        }
      } catch (e) {
        // Handle the timeout exception
        setState(() {
          _errorMessage = 'Connection timed out.';
        });
      } finally {
        setState(() {
          _isProcessing = false;
        });
      }
    } else {
      // No file selected
      // Handle this case if needed
    }
  }

  Future<void> _result() async {
    if (percentageIdentity! >= 98.0) {
      // Display an alert dialog
      AlertDialog(
        title: const Text('Congratulations!'),
        content: const Text(
            'Your percentage identity is greater than or equal to 98%.'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context as BuildContext, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context as BuildContext, 'OK'),
            child: const Text('OK'),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Test Page'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamed(context, 'main');
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  height: 15,
                ),
                Image.asset('assets/test.jpg'),
                SizedBox(height: 16),
                TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: 'Upload your file',
                    suffixIcon: IconButton(
                      onPressed: _isProcessing ? null : _uploadFile,
                      icon: Icon(
                        Icons.file_upload,
                        color: _isFileUploaded ? Colors.purple : Colors.grey,
                      ),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                  controller: TextEditingController(text: _fileName),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _processFile,
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(190, 58),
                    primary: Colors.purple,
                    padding: EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 24.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Assuming the percentage identity is stored in a variable called 'percentageIdentity'
                    if (percentageIdentity! < 98) {
                      Alert(
                        context: context,
                        type: AlertType.success,
                        title: "Congratulations!",
                        desc: "You don't have a Colorectal Cancer",
                        buttons: [
                          DialogButton(
                            color: Colors.purple,
                            child: Text(
                              "OK",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () => Navigator.pop(context),
                            width: 120,
                          )
                        ],
                      ).show();
                    } else {
                      Alert(
                        context: context,
                        type: AlertType.warning,
                        title: "Sorry!",
                        desc: "You have a Colorectal Cancer",
                        buttons: [
                          DialogButton(
                            color: Colors.purple,
                            child: Text(
                              "OK",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () => Navigator.pop(context),
                            width: 120,
                          )
                        ],
                      ).show();
                    }
                  },
                  child: Text(
                    'result',
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(190, 58),
                    primary: Colors.purple,
                    padding: EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 24.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                if (percentageIdentity != null) SizedBox(height: 16),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Percentage Identity: ${percentageIdentity?.toStringAsFixed(2)}%',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 16,
                ),
                if (_errorMessage.isNotEmpty)
                  Text(
                    _errorMessage,
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.red,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
