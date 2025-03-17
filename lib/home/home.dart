// import 'package:flutter/material.dart';
// import '../calendar/calendar.dart';
// import '../navigationIcons/navigationIcons.dart';
// import '../voiceAssistant/voiceAssistant.dart';
// import '../tasks/tasks.dart';
// import '../inbox/inbox.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         return false; // Prevent back button from closing the app
//       },
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: Column(
//           children: [
//             _buildHeader(),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                   child: Column(
//                     children: [
//                       _buildDailyBriefing(),
//                       const SizedBox(height: 20),
//                       _buildTodaysSchedule(),
//                       const SizedBox(height: 20),
//                       _buildPriorityTasks(),
//                       const SizedBox(height: 20),
//                       _buildRecentEmails(),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             NavigationIcons(
//               currentIndex: _selectedIndex,
//               onItemTapped: _onItemTapped,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildBriefingItem(String text) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8.0),
//       child: Text(
//         text,
//         style: const TextStyle(fontSize: 14, color: Colors.black87),
//       ),
//     );
//   }

//   Widget _buildDailyBriefing() {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.grey[50],
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                   color: Colors.blue[50],
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: const Icon(
//                   Icons.bar_chart,
//                   color: Colors.blue,
//                   size: 20,
//                 ),
//               ),
//               const SizedBox(width: 12),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Daily Briefing',
//                     style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
//                   ),
//                   Text(
//                     'Your day at a glance',
//                     style: TextStyle(fontSize: 12, color: Colors.grey[600]),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           const SizedBox(height: 16),
//           _buildBriefingItem('3 meetings scheduled for today'),
//           _buildBriefingItem('2 high-priority tasks need attention'),
//           _buildBriefingItem('5 unread emails, 2 require response'),
//           const SizedBox(height: 12),
//           GestureDetector(
//             onTap: () {},
//             child: const Text(
//               'Ask for details',
//               style: TextStyle(
//                 color: Colors.blue,
//                 fontWeight: FontWeight.w500,
//                 fontSize: 14,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTodaysSchedule() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               children: [
//                 const Icon(
//                   Icons.calendar_today_rounded,
//                   color: Colors.blue,
//                   size: 18,
//                 ),
//                 const SizedBox(width: 8),
//                 const Text(
//                   "Today's Schedule",
//                   style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
//                 ),
//               ],
//             ),
//             GestureDetector(
//               onTap: () {},
//               child: const Text(
//                 'View all',
//                 style: TextStyle(color: Colors.blue, fontSize: 14),
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 12),
//         _buildScheduleItem('Team Standup', '30 min', '9:00 AM'),
//         _buildScheduleItem('Client Presentation', '1 hour', '11:30 AM'),
//         _buildScheduleItem('Project Planning', '45 min', '2:00 PM'),
//       ],
//     );
//   }

//   Widget _buildScheduleItem(String title, String duration, String time) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 10),
//       padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey[200]!),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 title,
//                 style: const TextStyle(
//                   fontWeight: FontWeight.w500,
//                   fontSize: 15,
//                 ),
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 duration,
//                 style: TextStyle(fontSize: 13, color: Colors.grey[600]),
//               ),
//             ],
//           ),
//           Text(
//             time,
//             style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildRecentEmails() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               children: [
//                 const Icon(Icons.email_outlined, color: Colors.blue, size: 18),
//                 const SizedBox(width: 8),
//                 const Text(
//                   "Recent Emails",
//                   style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
//                 ),
//               ],
//             ),
//             GestureDetector(
//               onTap: () {},
//               child: const Text(
//                 'View all',
//                 style: TextStyle(color: Colors.blue, fontSize: 14),
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 12),
//         _buildEmailItem(
//           'Design Team',
//           'New brand assets ready for review',
//           '10:23 AM',
//           true,
//         ),
//         _buildEmailItem('Sarah Johnson', '', '9:15 AM', false),
//       ],
//     );
//   }

//   Widget _buildEmailItem(
//     String sender,
//     String preview,
//     String time,
//     bool hasUnread,
//   ) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 12),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     Text(
//                       sender,
//                       style: const TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 15,
//                       ),
//                     ),
//                     if (hasUnread) ...[
//                       const SizedBox(width: 4),
//                       Container(
//                         width: 6,
//                         height: 6,
//                         decoration: const BoxDecoration(
//                           color: Colors.blue,
//                           shape: BoxShape.circle,
//                         ),
//                       ),
//                     ],
//                   ],
//                 ),
//                 if (preview.isNotEmpty)
//                   Padding(
//                     padding: const EdgeInsets.only(top: 4.0),
//                     child: Text(
//                       preview,
//                       style: TextStyle(fontSize: 13, color: Colors.grey[700]),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//           Text(time, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
//         ],
//       ),
//     );
//   }

//   Widget _buildPriorityTasks() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               children: [
//                 const Icon(
//                   Icons.check_box_outlined,
//                   color: Colors.blue,
//                   size: 18,
//                 ),
//                 const SizedBox(width: 8),
//                 const Text(
//                   "Priority Tasks",
//                   style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
//                 ),
//               ],
//             ),
//             GestureDetector(
//               onTap: () {},
//               child: const Text(
//                 'View all',
//                 style: TextStyle(color: Colors.blue, fontSize: 14),
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 12),
//         _buildTaskItem('Complete UI design', 'high', false),
//         _buildTaskItem('Review marketing plan', 'medium', false),
//         _buildTaskItem('Send invoice to client', 'high', true),
//       ],
//     );
//   }

//   Widget _buildTaskItem(String title, String priority, bool completed) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 8),
//       child: Row(
//         children: [
//           SizedBox(
//             width: 24,
//             height: 24,
//             child: Checkbox(
//               value: completed,
//               onChanged: (bool? value) {},
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(4),
//               ),
//               activeColor: Colors.blue,
//             ),
//           ),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Text(
//               title,
//               style: TextStyle(
//                 fontSize: 15,
//                 decoration: completed ? TextDecoration.lineThrough : null,
//                 color: completed ? Colors.grey : Colors.black87,
//                 decorationColor: Colors.grey,
//                 decorationThickness: 2,
//               ),
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//             decoration: BoxDecoration(
//               color:
//                   priority == 'high'
//                       ? Colors.red[50]
//                       : priority == 'medium'
//                       ? Colors.amber[50]
//                       : Colors.grey[50],
//               borderRadius: BorderRadius.circular(4),
//             ),
//             child: Text(
//               priority,
//               style: TextStyle(
//                 fontSize: 12,
//                 color:
//                     priority == 'high'
//                         ? Colors.red
//                         : priority == 'medium'
//                         ? Colors.amber[700]
//                         : Colors.grey[700],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildHeader() {
//     return Container(
//       padding: const EdgeInsets.only(top: 50, left: 16, right: 16, bottom: 8),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             spreadRadius: 1,
//             blurRadius: 1,
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Good morning',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.black.withOpacity(0.8),
//                 ),
//               ),
//               Text(
//                 'Saturday, March 15',
//                 style: TextStyle(fontSize: 12, color: Colors.grey[600]),
//               ),
//             ],
//           ),
//           Row(
//             children: [
//               IconButton(
//                 icon: const Icon(Icons.search, color: Colors.black54),
//                 onPressed: () {},
//               ),
//               IconButton(
//                 icon: const Icon(Icons.more_horiz, color: Colors.black54),
//                 onPressed: () {},
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../calendar/calendar.dart';
import '../navigationIcons/navigationIcons.dart';
import '../voiceAssistant/voiceAssistant.dart';
import '../tasks/tasks.dart';
import '../inbox/inbox.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // List of pages for navigation.
  final List<Widget> _pages = const [
    HomeContent(),
    CalendarPage(),
    VoiceAssistant(),
    Tasks(),
    Inbox(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, // Prevent back button from closing the app.
      child: Scaffold(
        backgroundColor: Colors.white,
        body: _pages[_selectedIndex],
        bottomNavigationBar: NavigationIcons(
          currentIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}

// The home screen content.
class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, left: 16, right: 16, bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good morning',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(0.8),
                ),
              ),
              Text(
                'Saturday, March 15',
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.search, color: Colors.black54),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.more_horiz, color: Colors.black54),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBriefingItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14, color: Colors.black87),
      ),
    );
  }

  Widget _buildDailyBriefing(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.bar_chart,
                  color: Colors.blue,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Daily Briefing',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  Text(
                    'Your day at a glance',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildBriefingItem('3 meetings scheduled for today'),
          _buildBriefingItem('2 high-priority tasks need attention'),
          _buildBriefingItem('5 unread emails, 2 require response'),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () {},
            child: const Text(
              'Ask for details',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTodaysSchedule(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.calendar_today_rounded,
                  color: Colors.blue,
                  size: 18,
                ),
                const SizedBox(width: 8),
                const Text(
                  "Today's Schedule",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'View all',
                style: TextStyle(color: Colors.blue, fontSize: 14),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        _buildScheduleItem('Team Standup', '30 min', '9:00 AM'),
        _buildScheduleItem('Client Presentation', '1 hour', '11:30 AM'),
        _buildScheduleItem('Project Planning', '45 min', '2:00 PM'),
      ],
    );
  }

  Widget _buildScheduleItem(String title, String duration, String time) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[200]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                duration,
                style: TextStyle(fontSize: 13, color: Colors.grey[600]),
              ),
            ],
          ),
          Text(
            time,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildPriorityTasks(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.check_box_outlined,
                  color: Colors.blue,
                  size: 18,
                ),
                const SizedBox(width: 8),
                const Text(
                  "Priority Tasks",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'View all',
                style: TextStyle(color: Colors.blue, fontSize: 14),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        _buildTaskItem('Complete UI design', 'high', false),
        _buildTaskItem('Review marketing plan', 'medium', false),
        _buildTaskItem('Send invoice to client', 'high', true),
      ],
    );
  }

  Widget _buildTaskItem(String title, String priority, bool completed) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(
              value: completed,
              onChanged: (bool? value) {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              activeColor: Colors.blue,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 15,
                decoration: completed ? TextDecoration.lineThrough : null,
                color: completed ? Colors.grey : Colors.black87,
                decorationColor: Colors.grey,
                decorationThickness: 2,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color:
                  priority == 'high'
                      ? Colors.red[50]
                      : priority == 'medium'
                      ? Colors.amber[50]
                      : Colors.grey[50],
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              priority,
              style: TextStyle(
                fontSize: 12,
                color:
                    priority == 'high'
                        ? Colors.red
                        : priority == 'medium'
                        ? Colors.amber[700]
                        : Colors.grey[700],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentEmails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.email_outlined, color: Colors.blue, size: 18),
                const SizedBox(width: 8),
                const Text(
                  "Recent Emails",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'View all',
                style: TextStyle(color: Colors.blue, fontSize: 14),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        _buildEmailItem(
          'Design Team',
          'New brand assets ready for review',
          '10:23 AM',
          true,
        ),
        _buildEmailItem('Sarah Johnson', '', '9:15 AM', false),
      ],
    );
  }

  Widget _buildEmailItem(
    String sender,
    String preview,
    String time,
    bool hasUnread,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      sender,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    if (hasUnread) ...[
                      const SizedBox(width: 4),
                      Container(
                        width: 6,
                        height: 6,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ],
                ),
                if (preview.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      preview,
                      style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                    ),
                  ),
              ],
            ),
          ),
          Text(time, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    _buildDailyBriefing(context),
                    const SizedBox(height: 20),
                    _buildTodaysSchedule(context),
                    const SizedBox(height: 20),
                    _buildPriorityTasks(context),
                    const SizedBox(height: 20),
                    _buildRecentEmails(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
