// import 'package:flutter/material.dart';
// import '../home/home.dart';
// import '../calendar/calendar.dart';
// import '../voiceAssistant/voiceAssistant.dart';
// import '../tasks/tasks.dart';
// import '../inbox/inbox.dart';

// class NavigationIcons extends StatelessWidget {
//   final int currentIndex;
//   final ValueChanged<int> onItemTapped;

//   const NavigationIcons({
//     Key? key,
//     required this.currentIndex,
//     required this.onItemTapped,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             spreadRadius: 1,
//             blurRadius: 5,
//             offset: const Offset(0, -1),
//           ),
//         ],
//       ),
//       child: BottomNavigationBar(
//         currentIndex: currentIndex,
//         onTap: (index) => _navigateToScreen(index, context),
//         type: BottomNavigationBarType.fixed,
//         backgroundColor: Colors.white,
//         selectedItemColor: Colors.blue,
//         unselectedItemColor: Colors.grey,
//         showUnselectedLabels: true,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.calendar_today),
//             label: 'Calendar',
//           ),
//           BottomNavigationBarItem(icon: Icon(Icons.mic), label: 'Voice'),
//           BottomNavigationBarItem(icon: Icon(Icons.check_box), label: 'Tasks'),
//           BottomNavigationBarItem(icon: Icon(Icons.email), label: 'Inbox'),
//         ],
//       ),
//     );
//   }

//   void _navigateToScreen(int index, BuildContext context) {
//     if (index == currentIndex) return;

//     Widget nextScreen;
//     switch (index) {
//       case 0:
//         nextScreen = const HomePage();
//         break;
//       case 1:
//         nextScreen = const CalendarPage();
//         break;
//       case 2:
//         nextScreen = const VoiceAssistant();
//         break;
//       case 3:
//         nextScreen = const Tasks();
//         break;
//       case 4:
//         nextScreen = const Inbox();
//         break;
//       default:
//         return;
//     }

//     Navigator.pushAndRemoveUntil(
//       context,
//       MaterialPageRoute(builder: (context) => nextScreen),
//       (route) => false,
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../home/home.dart';
import '../calendar/calendar.dart';
import '../voiceAssistant/voiceAssistant.dart';
import '../tasks/tasks.dart';
import '../inbox/inbox.dart';

class NavigationIcons extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onItemTapped;

  const NavigationIcons({
    Key? key,
    required this.currentIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          if (index != currentIndex) {
            onItemTapped(index);
            _navigateToScreen(index, context);
          }
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.mic), label: 'Voice'),
          BottomNavigationBarItem(icon: Icon(Icons.check_box), label: 'Tasks'),
          BottomNavigationBarItem(icon: Icon(Icons.email), label: 'Inbox'),
        ],
      ),
    );
  }

  void _navigateToScreen(int index, BuildContext context) {
    Widget nextScreen;
    switch (index) {
      case 0:
        nextScreen = const HomePage();
        break;
      case 1:
        nextScreen = const CalendarPage();
        break;
      case 2:
        nextScreen = const VoiceAssistant();
        break;
      case 3:
        nextScreen = const Tasks();
        break;
      case 4:
        nextScreen = const Inbox();
        break;
      default:
        return;
    }

    // Use Navigator.push so that when the new screen is closed,
    // the user is returned to the previous screen.
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => nextScreen),
    );
  }
}
