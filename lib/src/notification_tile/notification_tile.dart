import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';

import '../../constants.dart';

/// This widget is responsible for structuring the [NotificationCard].
class NotificationTile extends StatelessWidget {
  final String cardTitle;
  final DateTime date;
  final String title;
  final String subtitle;
  final EdgeInsets? padding;
  final double height;
  final double spacing;
  final double cornerRadius;
  final Color color;
  final TextStyle titleTextStyle;
  final TextStyle? subtitleTextStyle;
  final List<BoxShadow>? boxShadow;
  final Widget icon;

  const NotificationTile({
    Key? key,
    required this.title,
    required this.cardTitle,
    required this.date,
    required this.subtitle,
    required this.height,
    required this.cornerRadius,
    required this.color,
    required this.titleTextStyle,
    required this.subtitleTextStyle,
    required this.boxShadow,
    required this.icon,
    this.spacing = 0,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Map<int, String> weekdayName = {
      1: "Mon",
      2: "Tue",
      3: "Wed",
      4: "Thu",
      5: "Fri",
      6: "Sat",
      7: "Sun"
    };
    int day() {
      DateTime currentDate = DateTime.now();
      DateTime notificationDate = date;
      if (currentDate.year == notificationDate.year &&
          currentDate.month == notificationDate.month &&
          currentDate.day == notificationDate.day) {
        return 2;
      } else {
        if (currentDate.year == notificationDate.year &&
            currentDate.month == notificationDate.month) {
          if (currentDate.day - notificationDate.day < 7) {
            return 1;
          }
          return 0;
        }
        return 0;
      }
    }

    return Container(
      margin: padding,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(cornerRadius),
        boxShadow: boxShadow,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    cardTitle,
                    style: kCardTopTextStyle,
                    maxLines: 1,
                  ),
                ),
                day() == 2
                    ? Text(
                        'Today ${DateFormat('h:mm a').format(date)}',
                        style: kCardTopTextStyle,
                      )
                    : day() == 1
                        ? Text(
                            '${weekdayName[DateTime.now().weekday]} ${DateFormat('h:mm a').format(date)}',
                            style: kCardTopTextStyle,
                          )
                        : Text(
                            '${DateFormat('M/d/y').format(date)}',
                            style: kCardTopTextStyle,
                          )
              ],
            ),
          ),
          SizedBox(
            height: 17,
          ),
          ListTile(
            leading: icon,
            iconColor:
                Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
            title: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: titleTextStyle,
            ),
            subtitle: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height*0.06,
                child: Html(
                  data: subtitle,
                  // maxLines: 2,
                  // overflow: TextOverflow.ellipsis,
                  // style: subtitleTextStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
