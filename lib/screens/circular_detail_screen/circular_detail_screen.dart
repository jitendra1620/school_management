import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart'; 
import 'package:school_management/models/CircularDataModel/circular_data_model.dart';

class CircularDetailsScreen extends StatefulWidget {
  final CircularDataModel circularDetail;
  const CircularDetailsScreen({super.key, required this.circularDetail});

  @override
  State<CircularDetailsScreen> createState() => _CircularDetailsScreenState();
}

class _CircularDetailsScreenState extends State<CircularDetailsScreen> {
  // Circular ID

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Circular Details'),
      ),
      body: Container(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Image.network(widget.circularDetail.coverImage),
            const SizedBox(height: 16),
            Text(
              widget.circularDetail.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Date: ${widget.circularDetail.dateCircular}',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Text(
              widget.circularDetail.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Open the Google Drive folder link
                // You can use url_launcher package to open the URL in a browser
              },
              child: const Text('Open Drive Folder'),
            ),
            const SizedBox(height: 16),
            Html(data: widget.circularDetail.htmlDetail), // Render HTML details
          ],
        ),
      ),
    );
  }
}
