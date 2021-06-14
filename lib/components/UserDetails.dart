import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class UserDetailsClass {
  UserDetailsClass({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.picture,
    required this.dateOfBirth,
    required this.country,
    required this.registerDate,
    required this.phone,
    required this.gender,
  });

  String id;
  String firstName;
  String lastName;
  String email;
  String picture;
  String dateOfBirth;
  String country;
  String registerDate;
  String phone;
  String gender;
  factory UserDetailsClass.fromJson(Map<String, dynamic> json) =>
      UserDetailsClass(
          id: json["id"],
          firstName: json["firstName"],
          email: json["email"],
          lastName: json["lastName"],
          picture: json["picture"],
          dateOfBirth: json["dateOfBirth"],
          country: json["location"]["country"],
          registerDate: json["registerDate"],
          phone: json["phone"],
          gender: json["gender"]);
}

class UserDetails extends StatefulWidget {
  final String id;
  const UserDetails({Key? key, required this.id}) : super(key: key);

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  List postsdata = [];
  bool isLoading = true;
  Future<UserDetailsClass> getUserDetails() async {
    var response;
    try {
      response = await Dio().get(
          'https://dummy-wireframe.iecsemanipal.com/social-media/user/${widget.id}?apikey=icuasa3h58w3gimaetcxs');

      if (response.statusCode == 200) {
        print(response.data["data"]);
        return UserDetailsClass.fromJson(response.data["data"]);
      } else {
        print('${response.statusCode} : ${response.data.toString()}');
        throw response.statusCode;
      }
    } catch (e) {
      print(e);
      throw e;
    }

    //return postsdata = response["data"];
  }

  GestureDetector detailCard(IconData icon, Color x1, Color x2, String text) {
    return GestureDetector(
      onTap: () async{
        String pos = icon == Icons.phone ? "1": "0";
        if(pos=="1"){
          await launch("tel:" + text);
        }
      },
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        // shadowColor: Colors.grey.shade300,
        elevation: 5.0,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    colors: <Color>[
                      x1,
                      x2,
                    ],
                  ).createShader(bounds);
                },
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 35,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // @override
  // void initState() {
  //   getUserDetails();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Panel Member"),
        centerTitle: true,
        // iconTheme: IconThemeData(
        //   color: Color(0xff050A30),
        // ),
        backgroundColor: Color(0xff050A30),
        elevation: 0,
      ),
      backgroundColor: Colors.grey.shade300,
      body: FutureBuilder<UserDetailsClass>(
        future: getUserDetails(),
        builder: (context, snapshot) {
          //  print(snapshot.data!.registerDate);
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(
                    Color(0xff050A30),
                  ),
                ),
              );
            default:
              if (snapshot.hasError)
                return Text("error while loading");
              else
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: ClipOval(
                          child: FadeInImage.assetNetwork(
                            placeholder:
                                'https://img.dummyapi.io/photo-1564694202779-bc908c327862.jpg',
                            image: snapshot.data!.picture,
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: Colors.black, width: 2.0)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          snapshot.data!.firstName +
                              " " +
                              snapshot.data!.lastName,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff050A30),
                            fontSize: 28,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Joined " +
                              DateFormat.yMMMd().format(
                                DateTime.parse(snapshot.data!.registerDate),
                                
                              ),
                              style: TextStyle(
                              color: Colors.grey.shade800,
                              fontSize: 16,
                            ),
                        ),
                      ),
                      GestureDetector(
                         onTap: () async {
                             String mailUrl = 'mailto:' + snapshot.data!.email;
                          await launch(mailUrl);
                        },
                        child: Text(snapshot.data!.email,
                        
                        style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.grey.shade900,
                              fontSize: 14,
                            ),
                        ),
                      ),
                      GridView.count(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(20),
                        childAspectRatio: 1.7,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                        children: [
                          detailCard(Icons.place, Color(0xff1f4037),
                              Color(0xff99f2c8), snapshot.data!.country),
                              
                          detailCard(Icons.person, Color(0xffF09819),
                              Color(0xffEDDE5D), snapshot.data!.gender,),
                          detailCard(Icons.phone, Color(0xffF09819),
                              Color(0xffEDDE5D), snapshot.data!.phone),
                          detailCard(
                              Icons.date_range_rounded,
                              Color(0xff1f4037),
                              Color(0xff99f2c8),
                              DateFormat.yMMMd().format(
                                  DateTime.parse(snapshot.data!.dateOfBirth))),
                        ],
                      ),
                    ],
                  ),
                );
          }
        },
      ),
    );
  }
}
