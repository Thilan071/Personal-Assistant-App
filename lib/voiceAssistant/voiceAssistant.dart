// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// // Your Gemini API key (keep it secure in production)
// const String geminiApiKey = "AIzaSyBKHPQDjcLg5LTanfIPQrLVJIymEKybD8M";

// // Gemini API endpoint with the API key appended as a query parameter.
// final Uri geminiUrl = Uri.parse(
//   "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=$geminiApiKey",
// );

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Voice Assistant',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: const VoiceAssistant(),
//     );
//   }
// }

// class VoiceAssistant extends StatefulWidget {
//   const VoiceAssistant({Key? key}) : super(key: key);

//   @override
//   State<VoiceAssistant> createState() => _VoiceAssistantState();
// }

// class _VoiceAssistantState extends State<VoiceAssistant> {
//   final TextEditingController _messageController = TextEditingController();
//   final List<String> _messages =
//       []; // List to hold messages with prefixes "You:" or "Assistant:"
//   final ScrollController _scrollController = ScrollController();

//   // Function to send the message directly to the Gemini API
//   Future<void> sendMessage(String message) async {
//     try {
//       // Construct the request body as per the Gemini API requirements.
//       final Map<String, dynamic> requestBody = {
//         "contents": [
//           {
//             "parts": [
//               {"text": message},
//             ],
//           },
//         ],
//       };

//       final response = await http.post(
//         geminiUrl,
//         headers: {"Content-Type": "application/json"},
//         body: jsonEncode(requestBody),
//       );

//       debugPrint("Gemini API Response: ${response.body}");

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         // Extract reply text from the nested "content" field.
//         String reply = "";
//         if (data['candidates'] != null &&
//             data['candidates'] is List &&
//             data['candidates'].isNotEmpty) {
//           reply =
//               data['candidates'][0]['content']['parts'][0]['text'] ??
//               "No reply text found";
//         } else {
//           reply = "No candidates returned";
//         }
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

//   // Build a chat bubble based on the message type.
//   Widget _buildChatBubble(String message) {
//     // Determine if the message is from the user.
//     bool isUserMessage = message.startsWith("You:");
//     // Remove the prefix ("You:" or "Assistant:") for display.
//     String displayText = message.replaceFirst(
//       RegExp(r'^(You:|Assistant:) '),
//       '',
//     );

//     return Align(
//       alignment: isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 4),
//         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
//         constraints: BoxConstraints(
//           maxWidth: MediaQuery.of(context).size.width * 0.75,
//         ),
//         decoration: BoxDecoration(
//           color: isUserMessage ? Colors.blue : Colors.grey.shade300,
//           borderRadius: BorderRadius.only(
//             topLeft: const Radius.circular(16),
//             topRight: const Radius.circular(16),
//             bottomLeft:
//                 isUserMessage
//                     ? const Radius.circular(16)
//                     : const Radius.circular(0),
//             bottomRight:
//                 isUserMessage
//                     ? const Radius.circular(0)
//                     : const Radius.circular(16),
//           ),
//         ),
//         child: Text(
//           displayText,
//           style: TextStyle(
//             color: isUserMessage ? Colors.white : Colors.black87,
//             fontSize: 16,
//           ),
//         ),
//       ),
//     );
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
//                 color: Colors.grey.shade100,
//                 child: ListView.builder(
//                   controller: _scrollController,
//                   padding: const EdgeInsets.all(16),
//                   itemCount: _messages.length,
//                   itemBuilder: (context, index) {
//                     return _buildChatBubble(_messages[index]);
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
//                         color: Colors.grey.shade200,
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

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Voice Assistant',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const VoiceAssistant(),
    );
  }
}

class VoiceAssistant extends StatefulWidget {
  const VoiceAssistant({Key? key}) : super(key: key);

  @override
  State<VoiceAssistant> createState() => _VoiceAssistantState();
}

class _VoiceAssistantState extends State<VoiceAssistant> {
  final TextEditingController _messageController = TextEditingController();
  final List<String> _messages =
      []; // Holds messages with prefixes "You:" or "Assistant:"
  final ScrollController _scrollController = ScrollController();

  // Flag to show the loading (typing) effect.
  bool _isLoading = false;

  // Function to send the message to the Gemini API.
  Future<void> sendMessage(String message) async {
    setState(() {
      _isLoading = true;
    });
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
      setState(() {
        _isLoading = false;
      });
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

  // Build a chat bubble for regular messages.
  Widget _buildChatBubble(String message) {
    bool isUserMessage = message.startsWith("You:");
    String displayText = message.replaceFirst(
      RegExp(r'^(You:|Assistant:) '),
      '',
    );

    return Align(
      alignment: isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        decoration: BoxDecoration(
          color: isUserMessage ? Colors.blue : Colors.grey.shade300,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft:
                isUserMessage
                    ? const Radius.circular(16)
                    : const Radius.circular(0),
            bottomRight:
                isUserMessage
                    ? const Radius.circular(0)
                    : const Radius.circular(16),
          ),
        ),
        child: Text(
          displayText,
          style: TextStyle(
            color: isUserMessage ? Colors.white : Colors.black87,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  // Build a typing indicator bubble.
  Widget _buildTypingIndicator() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomRight: Radius.circular(16),
            bottomLeft: Radius.circular(0),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black54),
              ),
            ),
            SizedBox(width: 8),
            Text(
              "Assistant is typing...",
              style: TextStyle(color: Colors.black87, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Determine total number of items. If loading, add one extra for the typing indicator.
    final int itemCount = _messages.length + (_isLoading ? 1 : 0);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Custom app bar.
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
            // Chat messages list.
            Expanded(
              child: Container(
                color: Colors.grey.shade100,
                child: ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.all(16),
                  itemCount: itemCount,
                  itemBuilder: (context, index) {
                    if (index < _messages.length) {
                      return _buildChatBubble(_messages[index]);
                    } else {
                      // This is the typing indicator.
                      return _buildTypingIndicator();
                    }
                  },
                ),
              ),
            ),
            // Message input area.
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
                        color: Colors.grey.shade200,
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
