// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// // Your API key (keep it secure in production)
// const String chatApiKey = "AIzaSyBKHPQDjcLg5LTanfIPQrLVJIymEKybD8M";

// // Replace the URL below with your actual endpoint. For a physical device,
// // use your host machine's IP (e.g., http://192.168.24.217:5000/chat).
// final Uri url = Uri.parse("http://192.168.24.217:5000/chat");

// class VoiceAssistant extends StatefulWidget {
//   const VoiceAssistant({Key? key}) : super(key: key);

//   @override
//   State<VoiceAssistant> createState() => _VoiceAssistantState();
// }

// class _VoiceAssistantState extends State<VoiceAssistant> {
//   final TextEditingController _messageController = TextEditingController();
//   final List<String> _messages = []; // List to hold messages
//   final ScrollController _scrollController = ScrollController();

//   // Function to send the message to your chat API
//   Future<void> sendMessage(String message) async {
//     try {
//       final response = await http.post(
//         url,
//         headers: {
//           "Authorization": "Bearer $chatApiKey",
//           "Content-Type": "application/json",
//         },
//         body: jsonEncode({"message": message}),
//       );

//       debugPrint("API Response: ${response.body}");

//       if (response.statusCode == 200) {
//         // Assuming the API returns a JSON object with a "reply" field.
//         final reply = jsonDecode(response.body)["reply"];
//         setState(() {
//           _messages.add("Assistant: $reply");
//         });
//       } else {
//         setState(() {
//           _messages.add("Error: ${response.statusCode}");
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _messages.add("Error: $e");
//       });
//     } finally {
//       _scrollToBottom();
//     }
//   }

//   void _handleSend() {
//     final message = _messageController.text.trim();
//     if (message.isEmpty) return;
//     setState(() {
//       _messages.add("You: $message");
//     });
//     _messageController.clear();
//     _scrollToBottom();
//     sendMessage(message);
//   }

//   void _scrollToBottom() {
//     Future.delayed(const Duration(milliseconds: 100), () {
//       if (_scrollController.hasClients) {
//         _scrollController.animateTo(
//           _scrollController.position.maxScrollExtent,
//           duration: const Duration(milliseconds: 300),
//           curve: Curves.easeOut,
//         );
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _messageController.dispose();
//     _scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // App bar and SafeArea
//       body: SafeArea(
//         child: Column(
//           children: [
//             // Custom app bar
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               height: 56,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.1),
//                     blurRadius: 4,
//                     offset: const Offset(0, 1),
//                   ),
//                 ],
//               ),
//               child: Row(
//                 children: [
//                   IconButton(
//                     icon: const Icon(Icons.arrow_back, color: Colors.black),
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     padding: EdgeInsets.zero,
//                     constraints: const BoxConstraints(),
//                   ),
//                   const SizedBox(width: 16),
//                   const Text(
//                     'AI Assistant',
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   const Spacer(),
//                   IconButton(
//                     icon: const Icon(Icons.bolt, color: Colors.blue),
//                     onPressed: () {},
//                     padding: EdgeInsets.zero,
//                     constraints: const BoxConstraints(),
//                   ),
//                 ],
//               ),
//             ),
//             // Chat messages list
//             Expanded(
//               child: Container(
//                 color: Colors.grey[100],
//                 child: ListView.builder(
//                   controller: _scrollController,
//                   padding: const EdgeInsets.all(16),
//                   itemCount: _messages.length,
//                   itemBuilder: (context, index) {
//                     return Container(
//                       margin: const EdgeInsets.only(bottom: 8),
//                       child: Text(
//                         _messages[index],
//                         style: const TextStyle(fontSize: 16),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),
//             // Message input area
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.1),
//                     blurRadius: 4,
//                     offset: const Offset(0, -1),
//                   ),
//                 ],
//               ),
//               child: Row(
//                 children: [
//                   IconButton(
//                     icon: const Icon(Icons.mic, color: Colors.grey),
//                     onPressed: () {
//                       // Add voice input functionality if needed.
//                     },
//                   ),
//                   Expanded(
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 16),
//                       decoration: BoxDecoration(
//                         color: Colors.grey[200],
//                         borderRadius: BorderRadius.circular(24),
//                       ),
//                       child: TextField(
//                         controller: _messageController,
//                         decoration: const InputDecoration(
//                           hintText: 'Message AI Assistant...',
//                           hintStyle: TextStyle(color: Colors.grey),
//                           border: InputBorder.none,
//                         ),
//                       ),
//                     ),
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.send, color: Colors.grey),
//                     onPressed: _handleSend,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Your Gemini API key (keep it secure in production)
const String geminiApiKey = "AIzaSyBKHPQDjcLg5LTanfIPQrLVJIymEKybD8M";

// Gemini API endpoint with the API key appended as a query parameter.
final Uri geminiUrl = Uri.parse(
  "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=$geminiApiKey",
);

class VoiceAssistant extends StatefulWidget {
  const VoiceAssistant({Key? key}) : super(key: key);

  @override
  State<VoiceAssistant> createState() => _VoiceAssistantState();
}

class _VoiceAssistantState extends State<VoiceAssistant> {
  final TextEditingController _messageController = TextEditingController();
  final List<String> _messages = []; // List to hold messages
  final ScrollController _scrollController = ScrollController();

  // Function to send the message directly to the Gemini API
  Future<void> sendMessage(String message) async {
    try {
      // Construct the request body as per the Gemini API requirements.
      final Map<String, dynamic> requestBody = {
        "contents": [
          {
            "parts": [
              {"text": message},
            ],
          },
        ],
      };

      final response = await http.post(
        geminiUrl,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody),
      );

      debugPrint("Gemini API Response: ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        // Extract reply text from the nested "content" field.
        String reply = "";
        if (data['candidates'] != null &&
            data['candidates'] is List &&
            data['candidates'].isNotEmpty) {
          reply =
              data['candidates'][0]['content']['parts'][0]['text'] ??
              "No reply text found";
        } else {
          reply = "No candidates returned";
        }
        setState(() {
          _messages.add("Assistant: $reply");
        });
      } else {
        setState(() {
          _messages.add("Error: ${response.statusCode}");
        });
      }
    } catch (e) {
      setState(() {
        _messages.add("Error: $e");
      });
    } finally {
      _scrollToBottom();
    }
  }

  void _handleSend() {
    final message = _messageController.text.trim();
    if (message.isEmpty) return;
    setState(() {
      _messages.add("You: $message");
    });
    _messageController.clear();
    _scrollToBottom();
    sendMessage(message);
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar and SafeArea
      body: SafeArea(
        child: Column(
          children: [
            // Custom app bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 56,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    'AI Assistant',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.bolt, color: Colors.blue),
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
            ),
            // Chat messages list
            Expanded(
              child: Container(
                color: Colors.grey[100],
                child: ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.all(16),
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        _messages[index],
                        style: const TextStyle(fontSize: 16),
                      ),
                    );
                  },
                ),
              ),
            ),
            // Message input area
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, -1),
                  ),
                ],
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.mic, color: Colors.grey),
                    onPressed: () {
                      // Add voice input functionality if needed.
                    },
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: TextField(
                        controller: _messageController,
                        decoration: const InputDecoration(
                          hintText: 'Message AI Assistant...',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send, color: Colors.grey),
                    onPressed: _handleSend,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
