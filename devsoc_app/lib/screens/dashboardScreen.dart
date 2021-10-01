import 'package:devsoc_app/api/announcement.dart';
import 'package:devsoc_app/api/timeline.dart';
import 'package:devsoc_app/helpers/size.dart';
import 'package:devsoc_app/helpers/theme.dart';
import 'package:devsoc_app/utils/errorToast.dart';
import 'package:devsoc_app/widgets/linkCard.dart';
import 'package:devsoc_app/constants/svg.dart';
import 'package:devsoc_app/constants/links.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  ThemeHelper t = ThemeHelper();
  Announcements a = Announcements();
  Map? announcementDetails = {};
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final TimelineChecker tl = TimelineChecker();

  void initState() {
    getData();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light,
    );
    super.initState();
  }

  void _launchURL(String _url) async => await canLaunch(_url)
      ? await launch(_url)
      : showErrorToast("Could not launch URL", context);

  getData() async {
    announcementDetails = await a.getAnnouncements();
  }

  void _onRefresh() async {
    tl.checkTimeOne();
    getData();
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    SizeHelper s = SizeHelper(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: s.wHelper(6),
      ),
      child: Stack(
        children: [
          SmartRefresher(
            enablePullDown: true,
            header: CustomHeader(
              builder: (BuildContext context, _) {
                return Center(
                  child: CupertinoActivityIndicator(),
                );
              },
            ),
            controller: _refreshController,
            onRefresh: _onRefresh,
            child: SingleChildScrollView(
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: s.hHelper(15),
                    ),
                    Text(
                      "Announcements",
                      style: t.subheading,
                    ),
                    SizedBox(
                      height: s.hHelper(2),
                    ),
                    a.announcementsLoader.value
                        ? Container(
                            height: s.hHelper(15),
                            decoration: DottedDecoration(
                              borderRadius: BorderRadius.circular(30),
                              strokeWidth: 2,
                              color: t.activeColor,
                              shape: Shape.box,
                            ),
                            child: Center(
                              child: CircularProgressIndicator(
                                valueColor: new AlwaysStoppedAnimation<Color>(
                                    t.activeColor),
                              ),
                            ),
                          )
                        : announcementDetails!["announcements"] == null
                            ? Container(
                                height: s.hHelper(15),
                                decoration: DottedDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  strokeWidth: 2,
                                  color: t.activeColor,
                                  shape: Shape.box,
                                ),
                                child: Center(
                                  child: Text(
                                    'No Announcements yet!',
                                    style: t.smallTextColor,
                                  ),
                                ),
                              )
                            : Column(
                                children: [
                                  for (var announcement
                                      in announcementDetails!["announcements"])
                                    GestureDetector(
                                      onTap: () {
                                        if (announcement["link"] != null) {
                                          _launchURL(announcement["link"]);
                                        }
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                          bottom: s.hHelper(1),
                                        ),
                                        width: double.maxFinite,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: t.activeColor,
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: s.wHelper(5),
                                          vertical: s.hHelper(2),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  announcement["title"],
                                                  style: t.announcementTitle,
                                                ),
                                                Spacer(),
                                                announcement["link"] != null
                                                    ? Container(
                                                        child: Icon(
                                                          CupertinoIcons.link,
                                                          color: t.white,
                                                          size: 20,
                                                        ),
                                                      )
                                                    : Container()
                                              ],
                                            ),
                                            SizedBox(
                                              height: s.hHelper(0.5),
                                            ),
                                            Text(
                                              announcement["body"],
                                              style: t.smallText,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                    SizedBox(
                      height: s.hHelper(3),
                    ),
                    Text(
                      "Links",
                      style: t.subheading,
                    ),
                    SizedBox(
                      height: s.hHelper(2),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: LinkCard(
                            title: "Discord",
                            imgPath: discord,
                            bgColor: Color(0xff7289DA),
                          ),
                          onTap: () {
                            _launchUrl(discordLink);
                          },
                        ),
                        Spacer(),
                        GestureDetector(
                          child: LinkCard(
                            title: "Website",
                            imgPath: cc,
                            bgColor: Color(0xff000000),
                          ),
                          onTap: () {
                            _launchUrl(websiteLink);
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: s.hHelper(2),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: LinkCard(
                            title: "GitHub",
                            imgPath: github,
                            bgColor: Color(0xff000000),
                          ),
                          onTap: () {
                            _launchUrl(githubLink);
                          },
                        ),
                        Spacer(),
                        GestureDetector(
                          child: LinkCard(
                            title: "YouTube",
                            imgPath: youtube,
                            bgColor: Color(0xffFF0000),
                          ),
                          onTap: () {
                            _launchUrl(youtubeLink);
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: s.hHelper(2),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            color: t.bgColor,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: s.hHelper(8),
                ),
                Text(
                  "Home",
                  style: t.heading,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void _launchUrl(String url) async =>
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
