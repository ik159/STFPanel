import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Orgs extends StatefulWidget {
  const Orgs({Key? key}) : super(key: key);

  @override
  _OrgsState createState() => _OrgsState();
}

class _OrgsState extends State<Orgs> {
  List institutionData = [];
  bool isLoading = true;
  void getinstitutionData() async {
    var response;
    try {
      response = await Dio().get(
          'https://dummy-wireframe.iecsemanipal.com/institutions?apikey=icuasa3h58w3gimaetcxs');

      // var responseBody = json.decode(response);
      //print(responseBody);
      // print(response.data["count"]);
      setState(() {
        institutionData = response.data["data"];
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
    getinstitutionData();
  }

  Padding stockCard(String year, String area, String variable,
      String value, String type) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        elevation: 5,
        color:  Colors.grey.shade900,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                variable,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5, left: 20),
              child: Row(
                children: [
                  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        colors: <Color>[
                           Color(0xffF09819),
                        Color(0xffEDDE5D),
                        ],
                      ).createShader(bounds);
                    },
                    child: Icon(
                      Icons.place,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    area,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5, left: 20),
              child: Row(
                children: [
                  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        colors: <Color>[
                          Color(0xff1f4037),
                          Color(0xff99f2c8),
                        ],
                      ).createShader(bounds);
                    },
                    child: Icon(
                      Icons.date_range_rounded,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    year,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5, left: 20),
              child: Row(
                children: [
                  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        colors: <Color>[
                           Color(0xffF09819),
                        Color(0xffEDDE5D),
                        ],
                      ).createShader(bounds);
                    },
                    child: Icon(
                      Icons.storefront,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    type,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, left: 20),
              child: Row(
                children: [
                  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        colors: <Color>[
                          Color(0xff1f4037),
                          Color(0xff99f2c8),
                        ],
                      ).createShader(bounds);
                    },
                    child: Icon(
                      Icons.stacked_line_chart,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    value,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }

  final textcolor = Colors.white;
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
                          "Orgs",
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
                  itemCount: institutionData.length,
                  // postsdata.length,
                  itemBuilder: (context, index) {
                    //  print(postsdata[index]["owner"]["firstName"]);
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: stockCard(
                        institutionData[index]["year"].toString(),
                        institutionData[index]["area_name"],
                        institutionData[index]["variable"].toString(),
                        institutionData[index]["value"].toString(),
                        institutionData[index]["type"],
                      ),
                    );
                  },
                ),
              ],
            ),
          );
  }
}
