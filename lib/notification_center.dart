import 'package:flutter/material.dart';
import 'package:moodify/stacked_notification_cards.dart';


class NotificationCenter extends StatefulWidget {


  @override
  _NotificationCenterState createState() => _NotificationCenterState();
}

class _NotificationCenterState extends State<NotificationCenter> {


  List<NotificationCard> _listOfNotification = [
    NotificationCard(
      date: DateTime.now().subtract(
        const Duration(minutes: 4),
      ),
      leading: Icon(
        Icons.alarm,
        size: 48,
      ),
      title: 'MY FIRST JOURNAL',
      subtitle:
          "YOUR DUE DATE IS NEAR",
    ),
    NotificationCard(
      date: DateTime.now().subtract(
        const Duration(minutes: 4),
      ),
      leading: Icon(
        Icons.emergency_share_outlined,
        size: 48,
      ),
      title: 'HELP SITE 3',
      subtitle:
          "https://www.nimh.nih.gov/health/find-help",
    ),
    NotificationCard(
      date: DateTime.now().subtract(
        const Duration(minutes: 4),
      ),
      leading: Icon(
        Icons.emergency_share_outlined,
        size: 48,
      ),
      title: 'HELP SITE 2',
      subtitle:
      "https://www.thequint.com/fit/mind-it/indias-first-national-mental-health-helpline-kiran-is-launched",
    ),
    NotificationCard(
      date: DateTime.now().subtract(
        const Duration(minutes: 4),
      ),
      leading: Icon(
        Icons.emergency_share_outlined,
        size: 48,
      ),
      title: 'HELP SITE 1',
      subtitle:
      "https://main.mohfw.gov.in/Organisation/Departments-of-Health-and-Family-Welfare/emergency-medical-relief",
    ),
    NotificationCard(
      date: DateTime.now().subtract(
        const Duration(minutes: 4),
      ),
      leading: Icon(
        Icons.emergency_share_outlined,
        size: 48,
      ),
      title: 'iCall',
      subtitle:
      "022-25521111",
    ),
    NotificationCard(
      date: DateTime.now().subtract(
        const Duration(minutes: 4),
      ),
      leading: Icon(
        Icons.emergency_share_outlined,
        size: 48,
      ),
      title: 'FORTIS HOSPITAL NATIONAL HELPLINE',
      subtitle:
      "091-8376804102",
    ),
    NotificationCard(
      date: DateTime.now().subtract(
        const Duration(minutes: 4),
      ),
      leading: Icon(
        Icons.emergency_share_outlined,
        size: 48,
      ),
      title: 'Vandrevala Foundation',
      subtitle:
      "1860-266-2345",
    ),
    NotificationCard(
      date: DateTime.now().subtract(
        const Duration(minutes: 4),
      ),
      leading: Icon(
        Icons.emergency_share_outlined,
        size: 48,
      ),
      title: "GOVT MH Rehabilitation HELPLINE 'KIRAN'",
      subtitle:
      "18005990019",
    ),

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE1D9D1),
      appBar: AppBar(
        backgroundColor: const Color(0xFFD1D9E1),
        title:
         Padding(
            padding: const EdgeInsets.all(7),
            child: Text(
              'Updates and Reminders',style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 25),
            ),
          ),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: 500,
                height: 500,
                child:Image.asset("assets/images/health9.png")
            ),
            StackedNotificationCards(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 2.0,
                )
              ],
              notificationCardTitle: 'Message',
              notificationCards: [..._listOfNotification],
              cardColor: Color(0xFFF1F1F1),
              padding: 16,
              actionTitle: Text(
                'Notifications',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              showLessAction: Text(
                'Show less',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              onTapClearAll: () {
                setState(() {
                  _listOfNotification.clear();
                });
              },
              clearAllNotificationsAction: Icon(Icons.close),
              clearAllStacked: Text('Clear All'),
              cardClearButton: Text('clear'),
              cardViewButton: Text('view'),
              onTapClearCallback: (index) {
                setState(() {
                  _listOfNotification.removeAt(index);
                });
              },
              onTapViewCallback: (index) {


              },
            ),
          ],
        ),
      ),
    );
  }
}
