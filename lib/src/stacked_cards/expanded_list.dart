import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:linkify/linkify.dart';
import 'package:url_launcher/url_launcher.dart';
import '../model/notification_card.dart';
import '../notification_tile/notification_tile.dart';
import '../notification_tile/slide_button.dart';

typedef void OnTapSlidButtonCallback(int index);

/// This widget is shown after animating [AnimatedOffsetList].
/// Show all cards in a column, with the option to slide each card.
class ExpandedList extends StatefulWidget {
  final List<NotificationCard> notificationCards;
  final AnimationController controller;
  final double initialSpacing;
  final double spacing;
  final double tilePadding;
  final double endPadding;
  final double containerHeight;
  final Color tileColor;
  final double cornerRadius;
  final String notificationCardTitle;
  final TextStyle titleTextStyle;
  final TextStyle? subtitleTextStyle;
  final List<BoxShadow>? boxShadow;
  final Widget view;
  final Widget clear;
  final OnTapSlidButtonCallback onTapViewCallback;
  final OnTapSlidButtonCallback onTapClearCallback;

  const ExpandedList({
    Key? key,
    required this.notificationCards,
    required this.controller,
    required this.containerHeight,
    required this.initialSpacing,
    required this.spacing,
    required this.cornerRadius,
    required this.tileColor,
    required this.tilePadding,
    required this.notificationCardTitle,
    required this.titleTextStyle,
    required this.subtitleTextStyle,
    required this.boxShadow,
    required this.clear,
    required this.view,
    required this.onTapClearCallback,
    required this.onTapViewCallback,
    required this.endPadding,
  }) : super(key: key);

  @override
  State<ExpandedList> createState() => _ExpandedListState();
}

class _ExpandedListState extends State<ExpandedList> {
  /// Determines whether to show the [ExpandedList] or not
  /// When [AnimatedOffsetList] is shown this widget will not be shown.
  /// When there is only one notification then [ExpandedList] will
  /// always be shown.
  bool _getListVisibility(int length) {
    if (length == 1) {
      return true;
    } else if (widget.controller.value >= 0.8) {
      return true;
    } else {
      return false;
    }
  }

  /// The padding that will be shown at the bottom of
  /// all card, basically bottom padding of [ExpandedList]
  double _getEndPadding(int index) {
    if (index == widget.notificationCards.length - 1) {
      return widget.endPadding;
    } else {
      return 0;
    }
  }

  /// Spacing between two cards this value used
  /// to add padding under each SlidButton
  double _getSpacing(int index, double topSpace) {
    if (index == 0) {
      return 0;
    } else {
      return topSpace;
    }
  }

  /// Top padding of each cards initial padding will
  /// be same as AnimatedOffsetList inter card spacing
  /// then it will shrink (while animating). This will
  /// give bounce animation when cards are expanding.
  double _topPadding(int index) {
    return Tween<double>(
            begin: _getSpacing(index, widget.initialSpacing),
            end: _getSpacing(index, widget.spacing))
        .animate(
          CurvedAnimation(
            parent: widget.controller,
            curve: Interval(0.8, 1.0),
          ),
        )
        .value;
  }

  String? url;
  bool isImageURL(String url) {
    var link = extractURL(url);

    if (link != null) {
      return (link.endsWith('jpg') ||
          link.endsWith('jpeg') ||
          link.endsWith('png') ||
          link.endsWith('webp') ||
          link.endsWith('avif') ||
          link.endsWith('gif') ||
          link.endsWith('svg'));
    } else {
      return false;
    }
  }

  bool isStringAnURL(String url) {
    var link = extractURL(url);
    if (link != null) {
      try {
        bool _validURL = Uri.parse(link).isAbsolute;
        return _validURL;
      } catch (e) {
        return false;
      }
    } else {
      return false;
    }
  }

  String? extractURL(String text) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    String parsedstring1 = text.replaceAll(exp, ' ');

    var list = linkify(parsedstring1);
    for (var i in list) {
      if (i.runtimeType == UrlElement) {
        return i.originText;
      }
    }
    return null;
  }

  String? extractText(String text) {
    var list = linkify(text);
    for (var i in list) {
      if (i.runtimeType == TextElement) {
        return i.originText;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final reversedList = List.of(widget.notificationCards);
    reversedList.sort((a, b) => b.date.compareTo(a.date));
    return Visibility(
      visible: _getListVisibility(reversedList.length),
      child: SlidableNotificationListener(
        child: Column(
          key: ValueKey('ExpandedList'),
          children: [
            ...reversedList.map(
              (notification) {
                final index = reversedList.indexOf(notification);
                bool isImage = isImageURL(notification.subtitle);
                bool isURL = isStringAnURL(notification.subtitle);

                return BuildWithAnimation(
                  key: ValueKey(notification.date),
                  // slidKey: ValueKey(notification.dateTime),
                  onTapView: widget.onTapViewCallback,
                  view: widget.view,
                  clear: widget.clear,
                  containerHeight: widget.containerHeight,
                  cornerRadius: widget.cornerRadius,
                  onTapClear: widget.onTapClearCallback,
                  // spacing: _getSpacing(index, spacing),
                  spacing: 5,
                  boxShadow: widget.boxShadow,
                  index: index,
                  tileColor: widget.tileColor,
                  endPadding: _getEndPadding(index),
                  tilePadding: widget.tilePadding,
                  title: notification.title,
                  child: GestureDetector(
                    onTap: () {
                      notification.title == "The latest communications!"
                          ? launchUrl(Uri.parse(
                              "https://www.medpluspr.com/comunicadosmedlink"))
                          : notification.title ==
                                  "Las comunicaciones más recientes!"
                              ? launchUrl(Uri.parse(
                                  "https://www.medpluspr.com/medlinknews"))
                              : showDialog(
                                  context: context,
                                  builder: ((BuildContext context) {
                                    return AlertDialog(
                                      iconPadding: EdgeInsets.zero,
                                      //alignment: Alignment.center,
                                      icon: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            alignment: Alignment.topRight,
                                            child: IconButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                icon: Icon(Icons.close)),
                                          ),
                                          notification.leading,
                                        ],
                                      ),
                                      iconColor: Theme.of(context)
                                          .bottomNavigationBarTheme
                                          .selectedItemColor,
                                      title: Text(notification.title),
                                      content: SingleChildScrollView(
                                        child: isImage == true
                                            ? Column(
                                                children: [
                                                  extractText(notification
                                                              .subtitle) ==
                                                          null
                                                      ? SizedBox()
                                                      : SingleChildScrollView(
                                                          child: Container(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.8,
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.1,
                                                            child: Html(
                                                              data: extractText(
                                                                      notification
                                                                          .subtitle) ??
                                                                  "",
                                                            ),
                                                          ),
                                                        ),
                                                  Image(
                                                    image:
                                                        CachedNetworkImageProvider(
                                                            extractURL(
                                                                notification
                                                                    .subtitle)!),
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.3,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.2,
                                                  ),
                                                ],
                                              )
                                            : isURL == true
                                                ? Column(
                                                    children: [
                                                      extractText(notification
                                                                  .subtitle) ==
                                                              null
                                                          ? SizedBox()
                                                          : SingleChildScrollView(
                                                              child: Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.8,
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    0.1,
                                                                child: Html(
                                                                  data: extractText(
                                                                          notification
                                                                              .subtitle) ??
                                                                      "",
                                                                ),
                                                              ),
                                                            ),
                                                      InkWell(
                                                        child: Text(
                                                          extractURL(
                                                              notification
                                                                  .subtitle)!,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.blue),
                                                        ),
                                                        onTap: () {
                                                          launchUrl(Uri.parse(
                                                              extractURL(
                                                                  notification
                                                                      .subtitle)!));
                                                        },
                                                      ),
                                                    ],
                                                  )
                                                : SingleChildScrollView(
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.8,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.1,
                                                      child: Html(
                                                        data: notification
                                                            .subtitle,
                                                      ),
                                                    ),
                                                  ),
                                      ),
                                    );
                                  }));
                    },
                    child: NotificationTile(
                      cardTitle: widget.notificationCardTitle,
                      date: notification.date,
                      title: notification.title,
                      subtitle: notification.subtitle,
                      spacing: widget.spacing,
                      height: widget.containerHeight,
                      color: widget.tileColor,
                      cornerRadius: widget.cornerRadius,
                      titleTextStyle: widget.titleTextStyle,
                      subtitleTextStyle: widget.subtitleTextStyle,
                      boxShadow: widget.boxShadow,
                      icon: notification.leading,
                      padding: EdgeInsets.fromLTRB(
                        widget.tilePadding,
                        _topPadding(index),
                        widget.tilePadding,
                        _getEndPadding(index),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// This widget is used to animate each card when clear action is selected

class BuildWithAnimation extends StatefulWidget {
  final Widget child;
  final double cornerRadius;
  final double containerHeight;
  final Widget clear;
  final OnTapSlidButtonCallback onTapClear;
  final OnTapSlidButtonCallback onTapView;
  final int index;
  final List<BoxShadow>? boxShadow;
  final Color tileColor;
  final double endPadding;
  final double spacing;
  final double tilePadding;
  final Widget view;
  final String title;
  // final Key slidKey;

  const BuildWithAnimation({
    Key? key,
    required this.child,
    required this.cornerRadius,
    required this.containerHeight,
    required this.clear,
    required this.onTapClear,
    required this.index,
    required this.boxShadow,
    required this.tileColor,
    required this.endPadding,
    required this.spacing,
    required this.tilePadding,
    required this.onTapView,
    required this.view,
    required this.title,
  }) : super(key: key);

  @override
  _BuildWithAnimationState createState() => _BuildWithAnimationState();
}

class _BuildWithAnimationState extends State<BuildWithAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      key: ValueKey('BuildWithAnimation'),
      animation: _animationController,
      builder: (_, __) => Opacity(
        opacity: Tween<double>(begin: 1.0, end: 0.0)
            .animate(_animationController)
            .value,
        child: SizeTransition(
          sizeFactor:
              Tween<double>(begin: 1.0, end: 0.0).animate(_animationController),
          child: Slidable(
            key: UniqueKey(),
            endActionPane: ActionPane(
              extentRatio: (widget.title == "The latest communications!" ||
                      widget.title == "Las comunicaciones más recientes!")
                  ? 0.25
                  : 0.5,
              motion: BehindMotion(),
              // dismissible: DismissiblePane(onDismissed: () => widget.onTapClear(widget.index)),
              children: [
                SlideButton(
                  padding: EdgeInsets.fromLTRB(
                    0,
                    widget.spacing,
                    widget.tilePadding,
                    widget.endPadding,
                  ),
                  color: widget.tileColor,
                  boxShadow: widget.boxShadow,
                  height: widget.containerHeight,
                  child: widget.view,
                  onTap: (context) async {
                    Slidable.of(context)?.close();
                    widget.onTapView(widget.index);
                  },
                  leftCornerRadius: widget.cornerRadius,
                  rightCornerRadius: widget.cornerRadius,
                ),
                (widget.title == "The latest communications!" ||
                        widget.title == "Las comunicaciones más recientes!")
                    ? SizedBox()
                    : SlideButton(
                        padding: EdgeInsets.fromLTRB(
                          0,
                          widget.spacing,
                          widget.tilePadding,
                          widget.endPadding,
                        ),
                        color: widget.tileColor,
                        boxShadow: widget.boxShadow,
                        height: widget.containerHeight,
                        child: widget.clear,
                        onTap: (context) {
                          _animationController.forward().then(
                                (value) => widget.onTapClear(widget.index),
                              );
                        },
                        rightCornerRadius: widget.cornerRadius,
                        leftCornerRadius: widget.cornerRadius,
                      ),
              ],
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
