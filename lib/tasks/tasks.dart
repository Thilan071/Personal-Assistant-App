import 'package:flutter/material.dart';
import '../navigationIcons/navigationIcons.dart';

class Tasks extends StatefulWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  int _selectedIndex = 3; // Set to 3 for Tasks tab
  String _selectedTab = 'Today';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {},
          ),
          title: const Text(
            'Tasks',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.filter_list, color: Colors.black),
              onPressed: () {},
            ),
            const SizedBox(width: 8),
            Container(
              margin: const EdgeInsets.only(right: 16),
              child: FloatingActionButton(
                backgroundColor: Colors.blue,
                mini: false,
                child: const Icon(Icons.add, color: Colors.white),
                onPressed: () {},
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            // Tab buttons
            Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  _buildTabButton('All'),
                  _buildTabButton('Today'),
                  _buildTabButton('Upcoming'),
                ],
              ),
            ),

            // Task list
            _buildTaskItem(
              'Complete UI design',
              'Work',
              'Today',
              'high',
              false,
            ),

            _buildTaskItem(
              'Review marketing plan',
              'Marketing',
              'Today',
              'medium',
              false,
            ),

            _buildTaskItem(
              'Send invoice to client',
              'Finance',
              'Today',
              'high',
              true,
            ),
          ],
        ),
        bottomNavigationBar: NavigationIcons(
          currentIndex: _selectedIndex,
          onItemTapped: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }

  Widget _buildTabButton(String text) {
    bool isSelected = _selectedTab == text;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedTab = text;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.grey,
              fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTaskItem(
    String title,
    String category,
    String dueDate,
    String priority,
    bool isCompleted,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Checkbox
            Container(
              margin: const EdgeInsets.only(top: 4),
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                border: isCompleted ? null : Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4),
                color: isCompleted ? Colors.blue : Colors.white,
              ),
              child:
                  isCompleted
                      ? const Icon(Icons.check, color: Colors.white, size: 16)
                      : null,
            ),
            const SizedBox(width: 16),

            // Task details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            decoration:
                                isCompleted ? TextDecoration.lineThrough : null,
                            color: isCompleted ? Colors.grey : Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color:
                              priority == 'high'
                                  ? Colors.red[100]
                                  : Colors.amber[100],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          priority,
                          style: TextStyle(
                            color:
                                priority == 'high'
                                    ? Colors.red[700]
                                    : Colors.amber[700],
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.more_vert, color: Colors.grey),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        category,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(width: 16),
                      const Text("Due:", style: TextStyle(color: Colors.grey)),
                      const SizedBox(width: 4),
                      Text(dueDate, style: const TextStyle(color: Colors.grey)),
                    ],
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
