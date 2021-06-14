

import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wireframe/components/UserDetails.dart';

class SocialMedia extends StatefulWidget {
  const SocialMedia({Key? key}) : super(key: key);

  @override
  _SocialMediaState createState() => _SocialMediaState();
}

class _SocialMediaState extends State<SocialMedia> {
  List postsdata = [];
  bool isLoading = true;
  List userdetails = [{}];
  void getPostsData() async {
    var response;
    try {
      response = await Dio().get(
          'https://dummy-wireframe.iecsemanipal.com/social-media/posts?apikey=icuasa3h58w3gimaetcxs');

      // var responseBody = json.decode(response);
      //print(responseBody);
      // print(response.data["count"]);
      setState(() {
        postsdata = response.data["data"];
        isLoading = false;
      });
      // print(postsdata);
    } catch (e) {
      print(e);
    }

    //return postsdata = response["data"];
  }

  @override
  // ignore: must_call_super
  void initState() {
    getPostsData();
  }

  Container posts(
      String id,
      String time,
      String name,
      String dp,
      String postimage,
      String descpription,
      int likes,
      List tags,
      String link) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        shadowColor: Colors.black,
        elevation: 40.0,
        child: Container(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserDetails(id: id),
                      ),
                    );
                  },
                  child: Container(
                    child: ClipOval(
                      child: FadeInImage.assetNetwork(
                        placeholder: 'assets/images/9gu9.gif',
                        // ignore: unnecessary_null_comparison
                        image: dp == null
                            ? "https://img.dummyapi.io/photo-1564694202779-bc908c327862.jpg"
                            : dp,
                        fit: BoxFit.cover,
                        width: 40,
                      ),
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0xff050A30), width: 2.0),
                    ),
                  ),
                ),
                title: Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
                subtitle: Text(
                  DateFormat.yMMMd().add_jm().format(DateTime.parse(time)),
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
                dense: true,
                trailing: link == "NA"
                    ? SizedBox(
                        height: 0,
                      )
                    : IconButton(
                        onPressed: () async {
                          await launch(link);
                        },
                        icon: Icon(Icons.link),
                        color: Colors.black,
                      ),
              ),
              Container(
                height: 300,
                alignment: Alignment.bottomCenter,
                child: Stack(
                  children: [
                    Container(
                      height: 300,
                      width: double.infinity,
                      // decoration: BoxDecoration(),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        child: FadeInImage.assetNetwork(
                          placeholder: 'assets/images/9gu9.gif',
                          // ignore: unnecessary_null_comparison
                          image: postimage == null
                              ? "https://img.dummyapi.io/photo-1564694202779-bc908c327862.jpg"
                              : postimage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 45,
                        width: 120,
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: Offset(0, 7),
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            LikeButton(
                                size: 30.0,
                                likeCount: likes,
                                countBuilder:
                                    (int? count, bool isLiked, String text) {
                                  var color =
                                      isLiked ? Colors.black : Colors.grey;
                                  Widget result;
                                  if (count == 0) {
                                    result = Text(
                                      "love",
                                      style: TextStyle(color: color),
                                    );
                                  } else
                                    result = Text(
                                      text,
                                      style: TextStyle(color: color),
                                    );
                                  return result;
                                },
                                likeBuilder: (bool isLiked) {
                                  return Icon(
                                    Icons.favorite_border,
                                    color: isLiked ? Colors.red : Colors.black,
                                    size: 30.0,
                                  );
                                }),
                            LikeButton(
                              likeBuilder: (bool isLiked) {
                                return Icon(
                                  Icons.bookmark_border_rounded,
                                  color: isLiked
                                      ? Colors.blueAccent
                                      : Colors.black,
                                  size: 30.0,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        descpription,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 25,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: tags.length,
                        itemBuilder: (context, index) {
                          //   print(tags[index]);
                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: 7),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color(0xff050A30),
                                Color(0xff2C5364),
                              ]),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "#" + tags[index],
                              style: TextStyle(
                                color: Colors.grey.shade300,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isLoading == true
        ? Center(
            child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(
                Color(0xff050A30),
              ),
            ),
          )
        : SingleChildScrollView(
            child: Column(
            children: [
              Container(
                  color: Color(0xff050A30),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: EdgeInsets.only(left: 25, top: 15),
                        child: Text(
                          "Posts",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 20,
                // postsdata.length,
                itemBuilder: (context, index) {
                  //  print(postsdata[index]["owner"]["firstName"]);
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: posts(
                        postsdata[index]["owner"]["_id"],
                        postsdata[index]["publishDate"],
                        postsdata[index]["owner"]["firstName"],
                        postsdata[index]["owner"]["picture"],
                        postsdata[index]["image"],
                        postsdata[index]["text"],
                        postsdata[index]["likes"],
                        postsdata[index]["tags"],
                        postsdata[index]["link"] == null
                            ? "NA"
                            : postsdata[index]["link"]),
                  );
                },
              ),
            ],
          ));
  }
}
