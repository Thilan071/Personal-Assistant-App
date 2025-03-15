import 'package:flutter/material.dart';

class Inbox extends StatelessWidget {
  const Inbox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          'Inbox',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          _buildEmailItem(
            sender: 'Design Team',
            subject: 'New brand assets ready fo...',
            preview: 'Hello, I wanted to let you know...',
            time: '10:23 AM',
            isUnread: true,
            isStarred: false,
          ),
          _buildEmailItem(
            sender: 'Sarah Johnson',
            subject: 'Meeting follow-up',
            preview: 'Thanks for the productive meeting...',
            time: '9:15 AM',
            isUnread: false,
            isStarred: true,
          ),
          _buildEmailItem(
            sender: 'Project Manager',
            subject: 'Weekly status update requ...',
            preview: 'Hi team, Please send your week...',
            time: 'Yesterday',
            isUnread: true,
            isStarred: false,
          ),
          _buildEmailItem(
            sender: 'Marketing Team',
            subject: 'Upcoming campaign materials',
            preview: 'We\'re getting ready to launch our Q...',
            time: 'Yesterday',
            isUnread: false,
            isStarred: false,
          ),
          _buildEmailItem(
            sender: 'HR Department',
            subject: 'Important company announcement',
            preview: 'Dear team, We have some exciting ne...',
            time: 'May 10',
            isUnread: false,
            isStarred: true,
          ),
        ],
      ),
    );
  }

  Widget _buildEmailItem({
    required String sender,
    required String subject,
    required String preview,
    required String time,
    required bool isUnread,
    required bool isStarred,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (isUnread)
                  Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.only(right: 8),
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                Expanded(
                  child: Text(
                    sender,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight:
                          isUnread ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
                Text(
                  time,
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
                if (isStarred)
                  const Padding(
                    padding: EdgeInsets.only(left: 4),
                    child: Icon(Icons.star, color: Colors.amber, size: 16),
                  ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              subject,
              style: TextStyle(
                fontWeight: isUnread ? FontWeight.bold : FontWeight.normal,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              preview,
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
