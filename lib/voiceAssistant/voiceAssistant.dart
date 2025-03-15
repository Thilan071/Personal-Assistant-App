import 'package:flutter/material.dart';

class VoiceAssistant extends StatefulWidget {
  const VoiceAssistant({Key? key}) : super(key: key);

  @override
  State<VoiceAssistant> createState() => _VoiceAssistantState();
}

class _VoiceAssistantState extends State<VoiceAssistant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // App bar
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
                    onPressed: () {},
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

            // Chat area
            Expanded(
              child: Container(
                color: Colors.grey[100],
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    // Assistant message
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Text(
                        "Hello! I'm your AI assistant. How can I help you today?",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Time stamp
                    const Padding(
                      padding: EdgeInsets.only(top: 4, bottom: 24),
                      child: Text(
                        '05:42 PM',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ),

                    // Suggestions section
                    const Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Text(
                        'Suggestions:',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ),

                    // Suggestion chips
                    _buildSuggestionChip("What's on my schedule today?"),
                    const SizedBox(height: 8),
                    _buildSuggestionChip("Set a reminder for 5pm"),
                    const SizedBox(height: 8),
                    _buildSuggestionChip("Summarize my unread emails"),
                    const SizedBox(height: 8),
                    _buildSuggestionChip(
                      "Create a task: Submit project report",
                    ),
                  ],
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
                    onPressed: () {},
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: 'Message AI Assistant...',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send, color: Colors.grey),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSuggestionChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(24),
      ),
      child: Text(text, style: const TextStyle(fontSize: 14)),
    );
  }
}
